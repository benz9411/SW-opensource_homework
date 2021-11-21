## SW-opensource_homework
---

### **1. Getopt 명령어**

명령행 플래그와 매개변수를 구문 분석하는 용도이다.

``` c
  getopt optstring parameters
       getopt [options] [--] optstring parameters
       getopt [options] -o|--options optstring [options] [--] parameters
 ```
getopt 명령을 스켈레톤 쉘 스크립트에서 사용하여 옵션을 구문 분석할 수 있다.
```
#!/usr/bin/bsh
# parse command line into arguments
set -- `getopt a:bc $*`
# check result of parsing
if [ $? != 0 ]
then
        exit 1
fi
while [ $1 != -- ]
do
        case $1 in
        -a)     # set up the -a flag
                AFLG=1
                AARG=$2
                shift;;
        -b)     # set up the -b flag
                BFLG=1;;
        -c)     # set up the -c flag
                CFLG=1;;
        esac
        shift   # next flag
done
shift   # skip --
# now do the work
.
.
.
```
프로그램이 한정된 인수들의 개수를 갖지 않거나 모든 인수들을 한꺼번에 취하지 않는다면 같은 방법으로 인수들을 취할 수도 있지만 그것을 구문 분석하기 위해 getopt을 사용해서 인수들을 처리하는 것이 보다 효과적이다.

---

### **2.getopts 명령어**

getopts 명령은 매개변수 리스트에서 옵션 및 옵션 인수를 검색하는 쉘 내장 명령입니다.

`getopts optstring name [arg]`

```
#!/bin/bash 
while getopts ":a:bc:" flag;do 
    echo "flag -$flag, argument $OPTARG"; 
done
```
getopts 앞에 주어진("a:bc:")과 일치한는 인수를 반복하는 while 실행하고 플래그 값을 변수 flag에 저장합니다.
플래그에 연관된 인수가 있는 경우 변수 argument에 저장합니다.

1.모든 옵션 문자에 대해 getopts는 변수에 옵션을 저장 하고 루프를 반복합니다.
2.콜론이(:) 뒤따르는 모든 옵션 문자에는 $OPTARG 변수에 저장되는 인수가 필요합니다.
3.getopts가 구문 분석할 수 없으면 오류를 인쇄합니다.


---

### **3.sed 명렁어**

stream editor의 약자이다. 파일에 대한 검색, 찾기 및 편집, 삽입 또는 삭제와 같은 많은 기능을 수행한다.

sed를 사용하면 파일을 열지 않고 편집이 가능하다 즉 ->vi편집기에서 파일을 연 다음 변경하는 것 보다 파일에서 무언가를 찾고 교체하는 훨씬 빠른 방법이다.

`sed 옵션... [script][inputfile..]`

1. 단어 치환

`cat > example.txt` 
hello world unix is opensource. i study unix

`$sed 's/unix/linux/' example.txt`
hello world linux is opensource. i study linux

2.특정 범위만큼 파일 내용 출력하기

`sed -n '1p' employees;`
`sed -n '1,3p' employees;`

![sed](https://user-images.githubusercontent.com/94780831/142763926-b4d8c807-e85a-4a1c-b32a-086929d3de64.PNG)

1.employees파일에서 첫 번째 행만 출력해서 화면에 보여준다.

2.employees파일에서 1~3라인 범위의 내용을 출력해서 화면에 보여준다.

더 많은 subcomman가 있습니다.

|subcommand|의미|
|:---|:---|
|a/|현재행에 하나 이상의 새로운 행을 추가한다.|
|i/|현재 행의 위에 텍스를 삽입한다.|
|p|행을 출력한다.|

---
### **4.awk 명령어**

awk는 데이터를 조작하고 보고서를 작성하는데 사용되는 스크립팅 언어다. awk는 컴파일이 필요하지 않으며 사용자가 변수,숫자,문자열,논리 연사자를 사용할 수 있다.

awk의 작업

+ 파일을 한 줄씩 스캔
+ 각 입력 줄을 필드로 분할
+ 입력 줄/필드를 비교
+ 일치하는 줄에서 작업 수행

`cat > employee.txt`

![awk](https://user-images.githubusercontent.com/94780831/142764399-5f94713f-a037-4306-8f20-6d8781f8a160.PNG)

`cat '/매니저/ {print}' employee.txt`


![awk2](https://user-images.githubusercontent.com/94780831/142764456-9ab53f0e-c019-4e09-9eff-722073d8866d.PNG)

처럼 이용이 가능하다.

|변수|설명|
|:---|:---|
|NR|명령은 입력 레코드 수의 현재 카운트를 유지합니다|
|RS|명령은 현재 레코드 구분 문자를 저장합니다|
|NF|명령은 현재 입력 레코드 내의 필드 수를 유지합니다
|OFS|OFS 명령은 Awk가 인쇄할 때 필드를 구분하는 출력 필드 구분 기호를 저장합니다|

`awk '{print NR,$0}' employee.txt `

![AWK3](https://user-images.githubusercontent.com/94780831/142764651-4ded52b9-bf35-45da-ab39-4479b81d4ccb.PNG)
