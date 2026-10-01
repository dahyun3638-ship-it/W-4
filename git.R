install.packages(c("usethis", "gitcreds"))
library("gitcreds")
# 1. 발급 페이지가 브라우저에 열림
usethis::create_github_token()
#   Note 칸에 용도를 적음 (예: ecoland-2026)
#   Expiration 은 90 days 정도
#   scope 는 repo, workflow, user 가 체크된 상태로 둘 것

# 2. 생성된 ghp_ 로 시작하는 문자열을 복사한 뒤
gitcreds::gitcreds_set()
#   콘솔이 물어보면 붙여넣고 엔터