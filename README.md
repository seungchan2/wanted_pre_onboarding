# wanted_pre_onboarding

# 앱 소개 
Open Weather API를 활용한 도시별 날씨 정보 리스트

## 구현 영상

https://user-images.githubusercontent.com/80672561/174476989-7d5324d3-5e92-4006-9010-1f3643328db2.mov

## Description
- 라이브러리 사용없이 개발
- Storyboard를 활용하지 않고, Code로 UI 구현 
- Clean Architecture + MVVM 

## Skill 
```
Swift
Clean Architecture + MVVM 
UIKit, AutoLayout
URLSession
```

## Clean Architecture 적용
최근 Clean Architecture에 대해 공부를 하고 있는데, 이번 프로젝트에 처음 도입해봤다.

`Domain Layer` `Presentation Layer` `Data Layer` 를 명확하게 분리함으로 사용자에게 명확한 코드를 보여줄 수 있을 것이라고 생각했다.

의존성 해결을 위해서 사용했다. 일반적인 구조의 경우, 의존성의 방향이 (B->A) 로 되어 있고, 상위 계층에 변화가 생긴다면 하위 계층은 변화에 리스크가 커진다.

따라서, 프로토콜로 의존성 역전을 통해 상위 계층의 변화에 (B-> Protocol <- A) 대처하고자 하였다.

HTTP Request 하는 부분이 많지 않았고, 프로젝트 규모가 작다보니 Clean Architecture의 장점이 제대로 녹아 있지 않다고 생각을 했다.

또한 의존성에 대한 부분이 제대로 분리되어 있지 않은 것 같아 학습과 고민을 통해 리팩토링 예정이다.

## 라이브러리 없이 개발

외부 라이브러리 사용하면서 편하게 개발을 진행하였다면, 이번 프로젝트는 라이브러리 사용없이 개발을 진행하였다.

Alamofire 대신 URLSession, SnapKit, Then 대신 코드로 UI를 구현하면서 해당 라이브러리들의 근본적인 원리와 이해에 도움이 되었다.

또한 기존에 RxSwift, RxCocoa를 사용해 비동기 처리를 했다면, GCD 클로저를 통해 구현을 하였다.

WWDC 2021에 나온 async, await을 통해 처리를 할 예정이었지만, 기간 내에 시간과 학습이 부족하여 적용을 하지는 못했다. 

리팩토링 과정에서 async, await을 도입할 예정이다.

## HTTP Request 과정에서 크러쉬
```swift
  
    private let cities: [String] = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    .
    .
    .
     func getCityWeather() {
        cities.forEach {
            useCase.getCityWeather(query: $0) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    DispatchQueue.global().async {
                        self.weatherInfo.value.append(data)
                    }
        
                case .failure(_):
                    print("실패")
                }
            }
        }
    }
    .
    .
    .
    
```
cities 배열을 돌면서 `getCityWeather()` query에 하나씩 넣어주면서 서버 통신을 진행하였다.

(이 부분에서 배열을 돌면서 서버 통신을 진행하기 때문에 cities 배열의 원소 개수 만큼 request가 진행된다.)

(좋은 방법이 아닌 것 같다는 생각이 들었고, 만약 우리나라의 날씨 정보 뿐만 아니라 전 세계의 도시의 정보를 보여준다면 해당 방식은 더욱 더 선택지가 될 수 없을 것이라고 생각을 했다.)

(위와 같은 문제를 해결 할 방법에 대해 고민을 해보고 리팩토링을 진행할 예정이다.) 

하지만 실행될 때 열 번 중에 한 번의 꼴로 앱이 멈추는 현상이 아래와 같이 발생하였다.
<img width="452" alt="스크린샷 2022-06-19 오후 7 36 04" src="https://user-images.githubusercontent.com/80672561/174476840-e3362896-6663-4c88-97f2-e373156c6a8c.png">

해당 문제는 비동기 처리와 배열에 원소를 추가할 때 사용한 문법 문제라고 생각을 하여 수정을 하였다.

수정 전 코드 
```swift 
 case .success(let data):
      self.weatherInfo.value += [data]
```
수정 후 코드
```swift
    case .success(let data):
      DispatchQueue.global().async {
        self.weatherInfo.value.append(data)
}
```
현재는 크러쉬가 나지 않고 잘 빌드가 된다.

## UI
`*정해진 UI형태는 없으므로, 개인의 방식대로 UI를 표현해주시기 바랍니다.`

앞서 프로젝트를 진행을 하면서 디자이너가 그린 피그마, 제플린을 보면서 편하게 UI 작업을 해왔다.

하지만 이번 프로젝트에서는 정해진 UI가 없었다. 기존 애플 날씨 앱의 UI를 참고하여 구현을 하였다.

평소 프로젝트에서는 디자이너의 도움을 받아 편하게 작업을 했다면, 이번 프로젝트에서는 없이 구현을 하였는데

너무 당연하게 생각을 하지 않고, 사용자의 입장에서 좋은 UI란 무엇인지 고민을 해 볼 필요가 있다고 생각을 했다.





