import router from '@ohos.router';
import fs from '@ohos.file.fs';


@Entry
@Component
struct Main {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .onClick(() => {
          router.pushUrl({url: 'pages/uploading'})
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}