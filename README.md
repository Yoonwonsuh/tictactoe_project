# Tic Tac Toe Project

간단한 오프라인용 Tic Tac Toe Game Project

## 프로젝트 소개

- 인터넷 상관없이 Tic Tac Toe 게임을 즐기고싶다면.
- 경기한 내용들에 대해서 다시 돌려보고 싶다면.
- Tic Tac Toe Project를 추천 드립니다.

## 폴더 구조

- main.dart : 앱의 초기 실행 파일

- common
  - layout
    - default_screen.dart : Scaffold의 재활용 성으로 만들었으나, 간단한 프로젝트라 개별 screen에 별도 Scaffold를 적용
      
- home
  - screen
    - home_screen.dart : 메인 화면
   
- game
  - screen
    - game_screen.dart : 실제 Tic Tac Toe 게임을 할 때 보여지는 View
  - provider
    - game_provider.dart : 게임의 규칙을 저장하는 provider
  - function
    - game_function.dart : 종료/승리/무승부 시 표시되는 popup창을 나타나게 하는 function의 집합
  - component
    - game_state.dart : 게임의 상태를 표시해주는 Component
   
- history
  - screen
    - history_screen.dart : 게임의 기록들을 표시해주는 Screen
    - hisory_detail_screen.dart : 기록된 게임의 상세자료를 보기 위한 Screen
  - model
    - history_game_model : 각 게임의 기록들이 지녀야하는 data양식 model(.g.dart 포함)
  - database
    - history_database.dart : 로컬 저장소 DataBase의 양식
  - component
    - history_card.dart : history_screen에 Grid로 표시되는 각 Card View
    - hisotry_state_component.dart : history_detail_screen에 이전에 기록된 게임의 상태를 나타내주는 View Componenet

- setting
  - provider
    - setting_provider.dart : 게임을 시작할 시, 게임 설정 관련된 상태를 기록해 놓은 provider
  - function
    - setting_function.dart : 게임설정 실 필요한 함수들(설정 popup 띄워주기 및 색상 변경 저장하기)
  - component
    - setting_size.dart : 게임의 크기(3x3,4x4 등등)를 선택하는 component
    - setting_player_icon.dart : 각 Player의 아이콘을 선택하는 Component(player1,2 모두 해당 component 사용)
    - setting_dialog_dart : 게임설정(popup 의 View)
    - setting_choose_first.dart : 게임 실행 전 선공이 누구인지를 선택할 수 있는 Component

## 주요 기능

1. 게임 셋팅
   - 3x3, 4x4, 5x5, 6x6 의 Grid Board를 선택
   - 어떤 Player가 먼저 할지 선택(Random 포함)
   - player1의 아이콘 및 색상 선택
   - player2의 아이콘 및 색상 선택
  
2. 게임
   - 순서에 맞게 원하는 Cell에 Mark할 수 있음
   - 가로, 세로, 대각선을 하나의 Player가 가득 채우면 승리함
   - 모든 Cell을 다 기록하였는데, 승자가 없으면 무승부로 기록
   - 게임 내에서 물리기(바로 전의 자신의 턴으로 돌릴 수 있음 각자 3회)

## 사용 라이브러리
1. flutter_riverpod: ^2.4.10 : 전역 상태 관리 Package
2. sizer: ^2.0.15 : 반응형을 위한 Package(MediaQueary 대체)
3. flutter_colorpicker: ^1.0.3 : 자유도가 높은 컬러 선택 Package
4. hive: ^2.2.3 : shared_preferences 와 같은 로컬 저장소
5. hive_flutter: ^1.1.0 : shared_preferences 와 같은 로컬 저장소
6. path_provider: ^2.1.2 : hive Package 사용하기 위한 서브 Package
7. path: ^1.9.0 : hive Package 사용하기 위한 서브 Package
8. intl: ^0.19.0 : 각 게임의 종료시점 기록을 구하기 위한 DateTime용 Package

## 앞으로 추가할 기능
1. View 적인 완성도 높이기
2. 저장된 기록의 삭제 기능 추가하기
3. 별도의 Firebase 서버 구성하여, Api 통신으로 Upgrade 하기
