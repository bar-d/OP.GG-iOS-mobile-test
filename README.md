# OP.GG CodingTest README.md

> 프로젝트 기간: 2023-01-03 ~ 2022-01-09</br>
> 개발자: [바드](https://github.com/bar-d)</br>


## 📑 목차
- [개발자 소개](#개발자-소개)
- [프로젝트 소개](#프로젝트-소개)
- [폴더 구조](#폴더-구조)
- [구현화면](#구현화면)
- [주요기능설명](#주요기능설명)
- [Network_Wiki](#Network_Wiki)
- [Scene_Wiki](#Scene_Wiki)
- [TroubleShooting](#TroubleShooting)

## 개발자 소개
|[바드](https://github.com/bar-d)|
|:---:|
| <img src = "https://avatars.githubusercontent.com/u/92622931?v=4" width="250" height="250">| 


## 프로젝트 소개

- LeagueOfLegends 사용자 전적 검색 어플리케이션 [OP.GG](https://apps.apple.com/kr/app/op-gg-오피지지/id605722237) 코딩 테스트
- 사용자 전적 화면 구현, 무한 스크롤 및 전적 갱신 구현


### 개발환경
![](https://img.shields.io/badge/Xcode-14.0-blue) ![](https://img.shields.io/badge/iOS-10.0-orange) ![](https://img.shields.io/badge/Swift-5.7-orange)

### Target Version
![](https://img.shields.io/badge/Alamofire-5.6.5-red) ![](https://img.shields.io/badge/Kingfisher-6.3.1-red)

### API

- OP.GG 자체 Test API


### Architecture
#### MVVM
- `Model`
    - 프로젝트 레벨 비즈니스 로직 처리
- `View`
    - 디스플레이 표시
    - ViewModel로의 event 전달
- `ViewModel`
    - 프레젠테이션 로직 처리
    
#### Clean Architecture

![](https://i.imgur.com/nIJCIyn.png)

- 검색하고자 하는 소환사 이름을 `ViewModel`로 전달
- `ViewModel`에서 해당 소환사 이름을 바탕으로 네트워킹 메서드 호출
- `ViewModel`의 호출로 인한 `UseCase`의 네트워킹 메서드 호출
- `UseCase`의 호출로 인한 `Repository`의 네트워킹 메서드 호출
- `Repository`의 호출로 인한 `APIService` 내 실제 네트워킹 작업 실행
- `APIService` 네트워킹 결과물을 `Repository` -> `UseCase` -> `ViewModel`로 전달
- 네트워킹한 데이터를 바탕으로 `View`를 다시 그리기


## 폴더 구조
<details>
<summary> Detail </summary>   

```
└── OPGG-iOS-mobile-test
    ├── AppLifeCycle
    │   └── AppDelegate.swift
    ├── Data
    │   ├── DataMapping
    │   │   ├── DTOError.swift
    │   │   ├── MatchesResponseDTO.swift
    │   │   └── SummonerResponseDTO.swift
    │   └── Repository
    │       ├── DefaultMatchesRepository.swift
    │       └── DefaultSummonerRepository.swift
    ├── Domain
    │   ├── Entities
    │   │   ├── Matches.swift
    │   │   └── Summoner.swift
    │   ├── Interface
    │   │   └── Repository
    │   │       ├── MatchesRepository.swift
    │   │       └── SummonerRepository.swift
    │   └── UseCase
    │       ├── MatchesUseCase.swift
    │       └── SummonerUseCase.swift
    ├── Extension
    │   ├── CALayer+Extension.swift
    │   ├── CGRect+Extension.swift
    │   ├── Color+Extension.swift
    │   ├── Double+Extension.swift
    │   ├── Int+Extension.swift
    │   ├── String+Extension.swift
    │   └── UIFont+Extension.swift
    ├── Infrastructure
    │   └── Network
    │       ├── Common
    │       │   ├── APIError.swift
    │       │   ├── APIRequest.swift
    │       │   ├── APIService.swift
    │       │   ├── HTTPMethod.swift
    │       │   ├── URLHost.swift
    │       │   └── URLPath.swift
    │       └── OPGGAPI
    │           ├── OPGGAPIRequest.swift
    │           ├── OPGGAPIService.swift
    │           ├── OPGGMatchesAPIRequest.swift
    │           └── OPGGSummonerAPIRequest.swift
    ├── Protocol
    │   └── ReuseIdentifiable.swift
    ├── Resource
    │   ├── Assets.xcassets
    │   │   ├── AccentColor.colorset
    │   │   │   └── Contents.json
    │   │   ├── AppIcon.appiconset
    │   │   ├── IconAsset
    │   │   └── LaunchAsset
    │   ├── Base.lproj
    │   │   └── LaunchScreen.storyboard
    │   ├── Fonts
    │   └── Info.plist
    └── Scene
        ├── Common
        │   ├── CircleImageView.swift
        │   ├── GameType.swift
        │   ├── IndicatorView.swift
        │   ├── KDALabel.swift
        │   ├── KDAPercentLabel.swift
        │   ├── KillingSpreeType.swift
        │   ├── LeagueSummaryWinRateLabel.swift
        │   ├── PaddingLabel.swift
        │   ├── PercentLabel.swift
        │   ├── PlayedTimeLabel.swift
        │   ├── Rank.swift
        │   ├── RecentTwentyGameAnalysisLabel.swift
        │   └── ViewModel
        │       └── ViewModel.swift
        └── SummonerGameHistroy
            ├── SummonerGameHistoryTableView
            │   ├── SummonerGameHistoryTableHeaderView
            │   │   ├── LeagueSummaryView
            │   │   │   ├── LeagueSummaryScrollView.swift
            │   │   │   └── LeagueSummaryView.swift
            │   │   ├── RecentGameAnalysisView
            │   │   │   ├── MostWinRateView.swift
            │   │   │   ├── PositionView.swift
            │   │   │   ├── RecentGameAnalysisView.swift
            │   │   │   └── RecentTwentyGameAnalysisView.swift
            │   │   ├── SummonerGameHistoryTableHeaderView.swift
            │   │   └── TopView
            │   │       └── TopView.swift
            │   ├── SummonerGameHistoryTableView.swift
            │   └── SummonerGameInformationCell
            │       ├── AdditionalInformationView.swift
            │       ├── GameReultView.swift
            │       ├── ItemStackView.swift
            │       ├── KDAStackView.swift
            │       ├── SpellAndRuneStackView.swift
            │       └── SummonerGameInformationCell.swift
            ├── SummonerGameHistoryViewController.swift
            └── ViewModel
                └── SummonerGameHistoryViewModel.swift
```

</div>
</details>




## 구현화면
|실행 화면|가로 스크롤|
|:---:|:---:|
| <img src = "https://i.imgur.com/vFCd78Q.gif" width="300" height="600">| <img src = "https://i.imgur.com/L6eea9I.gif" width="300" height="600"> |
|전적 갱신|무한 스크롤|
| <img src = "https://i.imgur.com/ioJv3pH.gif" width="300" height="600">| <img src = "https://i.imgur.com/L4zXVPW.gif" width="300" height="600"> |

## 주요기능설명


### Networking


![](https://i.imgur.com/J4hz5Yh.png)
![](https://i.imgur.com/hv3kFDA.png)
![](https://i.imgur.com/XxgxQSW.png)
![](https://i.imgur.com/Xfbhd6x.png)
![](https://i.imgur.com/clZiyOZ.png)

- 소환사 이름을 바탕으로 기본 소환사 정보(`Summoner`) 불러오기
- 소환사 이름 및 `matches` 및 `createDate` 파라미터로 경기 전적(`matches`) 불러오기


## 🚀TroubleShooting
### 네트워크 URL 관련
#### 문제상황
- `Matches` 파라미터로부터 불러온 `champhions/imageUrl`의 이미지 URL이 잘못된 형식으로 와 이미지 파일을 불러오지 못함
- URL Scheme과 Domain 사이에 슬래시가 세개가 있어 파일을 불러오지 못하는 경우
- 해당 경우 같은 경우 `https://localhost/`처럼 URL Scheme과 도메인 사이에 localhost라는
![](https://i.imgur.com/TPRMdAV.png)
- URL Scheme이 붙어있지 않아서 파일을 불러오지 못하는 경우
![](https://i.imgur.com/sgS9hQE.png)


#### 해결방법
- `URL Extension`으로 
`URL Scheme`과 `Domain` 사이에 슬래시가 세개가 있는 경우는 슬래시를 하나 빼주고, 
`URL Scheme`이 붙어있지 않은 경우에는 `URL Scheme`을 직접 붙여주는 식으로 리팩토링
- 해당 방법 말고 다른 방법이 있는지 알아볼 필요가 있음
![](https://i.imgur.com/rcFEijT.png)
