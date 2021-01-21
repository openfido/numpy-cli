. ${AUTOTEST:-..}/assert.sh

assert $(numpy dot '1,2,3' '4;5;6') -eq 32

assert "$(numpy linalg.norm '1,2;3,4' ord=1 axis=0)" = "4,6"
assert "$(numpy linalg.norm '1,2;3,4' ord=1 axis=1)" = "3,7"
assert "$(numpy linalg.norm '1,2;3,4' ord=2 axis=0)" = "3.1622777,4.472136"
assert "$(numpy linalg.norm '1,2;3,4' ord=2 axis=1)" = "2.236068,5"
assert "$(numpy linalg.norm '1,2;3,4' ord=inf axis=0)" = "3,4"
assert "$(numpy linalg.norm '1,2;3,4' ord=inf axis=1)" = "2,4"
assert "$(numpy linalg.norm '1,2;3,4' ord=-inf axis=0)" = "1,2"
assert "$(numpy linalg.norm '1,2;3,4' ord=-inf axis=1)" = "1,3"

assert "$(numpy linalg.cond '1,2;3,4')" = "14.933034"
assert "$(numpy linalg.cond '1,2;3,4' p=fro)" = "15"
assert "$(numpy linalg.cond '1,2;3,4' p=inf)" = "21"
assert "$(numpy linalg.cond '1,2;3,4' p=-inf)" = "6"
assert "$(numpy linalg.cond '1,2;3,4' p=1)" = "21"
assert "$(numpy linalg.cond '1,2;3,4' p=-1)" = "6"
assert "$(numpy linalg.cond '1,2;3,4' p=2)" = "14.933034"
assert "$(numpy linalg.cond '1,2;3,4' p=-2)" = "0.066965626"

assert "$(numpy linalg.det '1,2;3,4')" -eq -2