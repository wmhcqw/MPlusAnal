import router from '@ohos.router';


@Entry
@Component

struct Uploading {
  @State message: string = 'Hi there'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
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