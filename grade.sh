# Create your grading script here

# set -e

CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
TotalGrade=2
file="ListExamples.java"

rm -rf student-submission
git clone $1 student-submission
cd student-submission

if [[ -f $file ]] && [[ -e $file ]]
then
    echo "File found!"
else
    echo "File not found!"
    exit 1
fi

cp TestListExamples.java student-submission/
javac -cp $CPATH *.java

if [[ $? -eq 0 ]]
then
    echo "Compile succeeded"
else
    echo "Program unable to compile"
    exit 2
fi

java -cp $CPATH  org.junit.runner.JUnitCore TestListExamples > errors.txt

if [[ $(grep -c "testFilter(TestListExamples)" errors.txt) -eq 1 ]]
then
     ((TotalGrade-=1))
    let "TotalGrade-=1"
    echo "[FAILED 0/1] testFilter"
fi

if [[ $(grep -c "testMerge(TestListExamples)" errors.txt) -eq 1 ]]
then
    ((TotalGrade-=1))
    let "TotalGrade-=1"
    echo "[FAILED 0/1] testMerge"
fi

echo Total Grade: $totalPoints/2