import router from '@ohos.router';
import http from '@ohos.net.http';

function get_token(client_id, client_secret) {
  let httpRequest = http.createHttp();
  httpRequest.request(
    "https://www.warcraftlogs.com/oauth/token",
    {
      method: http.RequestMethod.POST,
      header: {
        "Content-Type": "application/json",
      },
      extraData: {
        "grant_type": "client_credentials",
        "client_id": client_id,
        "client_secret": client_secret,
      },
    }, (err, data) => {
    if (!err) {
      const result = JSON.stringify(data.result);
      const json_result = JSON.parse(JSON.parse(result));
      console.log(json_result.access_token);
      httpRequest.off('headersReceive');
      httpRequest.destroy();
      return json_result.access_token;
    } else {
      console.error(JSON.stringify(err));
      httpRequest.off('headersReceive');
      httpRequest.destroy();
      return null;
    }
  }
  )
}

@Entry
@Component

struct Uploading {
  @State message: string = 'Hi there'
  @State client_id: string = ""
  @State client_secret: string = ""
  controller: TextInputController = new TextInputController()

  build() {
    Row() {
      Column() {
        // Title Text
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        // Client ID Input
        TextInput({
          placeholder: "输入Client ID",
          controller: this.controller,
        })
          .copyOption(CopyOptions.LocalDevice)
          .onChange((value: string) => {
            this.client_id = value;
          })
          .width("50%")

        // Client Secret Input
        TextInput({
          placeholder: "输入Client Secret",
          controller: this.controller
        })
          .onChange((value: string) => {
            this.client_secret = value;
          })
          .width("50%")

        // Get Token Button
        Button() {
          Text('Post')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .onClick(() => {
          get_token(this.client_id, this.client_secret);
        })

        // Back Button
        Button() {
          Text('Back')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .onClick(() => {
          router.pushUrl({url: 'pages/main'})
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}