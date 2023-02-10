.extern _ZN7ThreadK7runningE
.extern _ZN5Riscv10handleTrapEiPv
.align 4
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:

    csrw sscratch, t1

    ld t1, _ZN7ThreadK7runningE
    //prelazak na kernel stek
    //ovde treba i da upisem user stack pointer u polje user stack da bih mogao da ga pokupim
    sd sp, 72(t1)
    ld sp, 64(t1)

    csrr t1, sscratch

    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _ZN5Riscv10handleTrapEiPv

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256

    csrw sscratch, t1

    ld t1, _ZN7ThreadK7runningE
    //POVRATAK NA KORISNICKI STEK
    sd sp, 64(t1)
    ld sp, 72(t1)

    csrr t1, sscratch

    sret
