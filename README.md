# 프로젝트 소개 
TheMovieDB API를 사용한 영화 정보 어플입니다.
<br/><br/>

# 개발기간
2025.12.26~2025.1.02
<br/><br/>

# 기술 스택
- Framework: Flutter(SDK: ^3.5.4)
- Language: Dart
<br/><br/>

# 사용 라이브러리 
- flutter_riverpod
  - Flutter 앱에서 위젯의 상태 관리를 담당하는 라이브러리.
  - 선언적이고 테스트 가능한 상태 관리 방식 제공.   
- dio
  - Flutter 앱에서 사용되는 HTTP 클라이언트 라이브러리.
  - REST API 통신, 요청 헤더 관리, JSON 직렬화 등 네트워킹 기능 제공.
- flutter_dotenv
  - Flutter 앱에서 환경 변수를 쉽게 로드하고 관리할 수 있게 도와주는 라이브러리.
  - 민감한 정보(예: API 키)를 코드 외부에서 안전하게 관리.   
- mocktail
  - Flutter의 유닛 테스트에서 외부 의존성을 모킹(mocking)하여 비즈니스 로직만 테스트할 수 있도록 도와주는 라이브러리. 
<br/><br/>


# 주요기능
- Hero 위젯으로 상세페이지로 넘어갈 때 애니메이션 효과 적용.
- 클린 아키텍처로 프로젝트 설계.
- API 키를 발급 받고 데이터 가져와 사용.
