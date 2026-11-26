# 2026. 11. 26. 수업 내용

## C언어와 어셈블리 언어를 결합한 문제

```c
#include <stdio.h>

int main() {
  int a = 15;
  int b = 27;
  int result = 0;

  // a를 레지스터에 입력(%0), b를 레지스터에 입력(%1), 연산 결과를 출력 변수 result(%2)에 저장
    
  __asm__ (
      "addl %1, %0\n\t"
      "movl %0, %2"
      : "+r" (a), "r" (b), "=r" (result)
      :
      : "cc"
    );

  printf("합계: %d\n", result);
  return 0;
}
```

## 인예의지신, 중도
- 어질 인 / 옳을 의 / 예도 예 / 슬기 지 / 믿을 신 (측은지심)
- 정도껏, 눈치껏, 성의껏
