#lang planet neil/sicp

;第一种方式产生的迭代过程，会不断在answer前面insert新的元素，导致顺序是倒序的
;第二种方式使用cons list element，导致形成了一个从右到左的列表
;可以采用的方案是，将逆序的list传进去，然后基于第一种方式生成新列表，最后的结果就是正序缩放过的