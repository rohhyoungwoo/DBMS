--3번 HR 계정에 로그인하는 절차
/* cmd에서 자바 버전이 17로 되어있는지 확인한다
 * 확인 되었으면 sqlplus 를 입력해 다운로드한 오라클 버전을 확인하고 접속한다
 * 이후 먼저 관리자로 접속해야하기 때문에 sys as sysdba를 입력하고
 * 설정한 비밀번호 1234를 입력을하고 SQL로 들어간다
 * SQL로 들어가서 hr 계정 접속을 위해 한번더 sys계정으로 접속해준다
 * conn sys as sysdba후 비밀번호 1234 입력
 * show user;로 현재 연결된 유저네임을
 * HR계정의 이름과 비밀번호 연결을 위해 alter 명령어를 사용하여 락을 해제해준다
 * alter user-name unlocked
 * (하나씩 설정하며 나갔다와야함)
 * alter identified unlocked
 * 그 후 conn hr/1234; 명렁어를 사용하여 연결을 확인하고 종료한다
 */

--4번 DBeaver에서 Oracle DB 연결을 설정하는 방법
/* 새 데이터베이스를 연결(플러그표시 클릭)을 선택하여 오라클을 눌러주고
 * 오라클 선택하여 나오는 화면에서 Database를 ORCL에서 XE로 변경하고
 * 유저네임과 패스워드를 hr, 1234로 수정하고 왼쪽하단에 Test Connection을 클릭한다
 * 연결이 잘 되었으면 Driver Settings로 가서 2번째 라이브러리로 가서
 * 떠있는 항목들을 제거하고 add file을 눌러 ojbc6.jar가 있는 파일로 찾아들어가 선택해 주고 이를 추가해준다
 * 그후 
 * 
 * 
 *
 *
 *
 *
 *
 *
 */






