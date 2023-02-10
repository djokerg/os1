
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00009117          	auipc	sp,0x9
    80000004:	94813103          	ld	sp,-1720(sp) # 80008948 <_GLOBAL_OFFSET_TABLE_+0x50>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	354040ef          	jal	ra,80004370 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv14supervisorTrapEv>:
.align 4
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:

    csrw sscratch, t1
    80001000:	14031073          	csrw	sscratch,t1

    ld t1, _ZN7ThreadK7runningE
    80001004:	00008317          	auipc	t1,0x8
    80001008:	9cc33303          	ld	t1,-1588(t1) # 800089d0 <_ZN7ThreadK7runningE>
    //prelazak na kernel stek
    //ovde treba i da upisem user stack pointer u polje user stack da bih mogao da ga pokupim
    sd sp, 72(t1)
    8000100c:	04233423          	sd	sp,72(t1)
    ld sp, 64(t1)
    80001010:	04033103          	ld	sp,64(t1)

    csrr t1, sscratch
    80001014:	14002373          	csrr	t1,sscratch

    addi sp, sp, -256
    80001018:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000101c:	00013023          	sd	zero,0(sp)
    80001020:	00113423          	sd	ra,8(sp)
    80001024:	00213823          	sd	sp,16(sp)
    80001028:	00313c23          	sd	gp,24(sp)
    8000102c:	02413023          	sd	tp,32(sp)
    80001030:	02513423          	sd	t0,40(sp)
    80001034:	02613823          	sd	t1,48(sp)
    80001038:	02713c23          	sd	t2,56(sp)
    8000103c:	04813023          	sd	s0,64(sp)
    80001040:	04913423          	sd	s1,72(sp)
    80001044:	04a13823          	sd	a0,80(sp)
    80001048:	04b13c23          	sd	a1,88(sp)
    8000104c:	06c13023          	sd	a2,96(sp)
    80001050:	06d13423          	sd	a3,104(sp)
    80001054:	06e13823          	sd	a4,112(sp)
    80001058:	06f13c23          	sd	a5,120(sp)
    8000105c:	09013023          	sd	a6,128(sp)
    80001060:	09113423          	sd	a7,136(sp)
    80001064:	09213823          	sd	s2,144(sp)
    80001068:	09313c23          	sd	s3,152(sp)
    8000106c:	0b413023          	sd	s4,160(sp)
    80001070:	0b513423          	sd	s5,168(sp)
    80001074:	0b613823          	sd	s6,176(sp)
    80001078:	0b713c23          	sd	s7,184(sp)
    8000107c:	0d813023          	sd	s8,192(sp)
    80001080:	0d913423          	sd	s9,200(sp)
    80001084:	0da13823          	sd	s10,208(sp)
    80001088:	0db13c23          	sd	s11,216(sp)
    8000108c:	0fc13023          	sd	t3,224(sp)
    80001090:	0fd13423          	sd	t4,232(sp)
    80001094:	0fe13823          	sd	t5,240(sp)
    80001098:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv10handleTrapEiPv
    8000109c:	0fc020ef          	jal	ra,80003198 <_ZN5Riscv10handleTrapEiPv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010a0:	00013003          	ld	zero,0(sp)
    800010a4:	00813083          	ld	ra,8(sp)
    800010a8:	01013103          	ld	sp,16(sp)
    800010ac:	01813183          	ld	gp,24(sp)
    800010b0:	02013203          	ld	tp,32(sp)
    800010b4:	02813283          	ld	t0,40(sp)
    800010b8:	03013303          	ld	t1,48(sp)
    800010bc:	03813383          	ld	t2,56(sp)
    800010c0:	04013403          	ld	s0,64(sp)
    800010c4:	04813483          	ld	s1,72(sp)
    800010c8:	05013503          	ld	a0,80(sp)
    800010cc:	05813583          	ld	a1,88(sp)
    800010d0:	06013603          	ld	a2,96(sp)
    800010d4:	06813683          	ld	a3,104(sp)
    800010d8:	07013703          	ld	a4,112(sp)
    800010dc:	07813783          	ld	a5,120(sp)
    800010e0:	08013803          	ld	a6,128(sp)
    800010e4:	08813883          	ld	a7,136(sp)
    800010e8:	09013903          	ld	s2,144(sp)
    800010ec:	09813983          	ld	s3,152(sp)
    800010f0:	0a013a03          	ld	s4,160(sp)
    800010f4:	0a813a83          	ld	s5,168(sp)
    800010f8:	0b013b03          	ld	s6,176(sp)
    800010fc:	0b813b83          	ld	s7,184(sp)
    80001100:	0c013c03          	ld	s8,192(sp)
    80001104:	0c813c83          	ld	s9,200(sp)
    80001108:	0d013d03          	ld	s10,208(sp)
    8000110c:	0d813d83          	ld	s11,216(sp)
    80001110:	0e013e03          	ld	t3,224(sp)
    80001114:	0e813e83          	ld	t4,232(sp)
    80001118:	0f013f03          	ld	t5,240(sp)
    8000111c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001120:	10010113          	addi	sp,sp,256

    csrw sscratch, t1
    80001124:	14031073          	csrw	sscratch,t1

    ld t1, _ZN7ThreadK7runningE
    80001128:	00008317          	auipc	t1,0x8
    8000112c:	8a833303          	ld	t1,-1880(t1) # 800089d0 <_ZN7ThreadK7runningE>
    //POVRATAK NA KORISNICKI STEK
    sd sp, 64(t1)
    80001130:	04233023          	sd	sp,64(t1)
    ld sp, 72(t1)
    80001134:	04833103          	ld	sp,72(t1)

    csrr t1, sscratch
    80001138:	14002373          	csrr	t1,sscratch

    sret
    8000113c:	10200073          	sret

0000000080001140 <_ZN5Riscv13pushRegistersEv>:
.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256
    80001140:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001144:	00313c23          	sd	gp,24(sp)
    80001148:	02413023          	sd	tp,32(sp)
    8000114c:	02513423          	sd	t0,40(sp)
    80001150:	02613823          	sd	t1,48(sp)
    80001154:	02713c23          	sd	t2,56(sp)
    80001158:	04813023          	sd	s0,64(sp)
    8000115c:	04913423          	sd	s1,72(sp)
    80001160:	04a13823          	sd	a0,80(sp)
    80001164:	04b13c23          	sd	a1,88(sp)
    80001168:	06c13023          	sd	a2,96(sp)
    8000116c:	06d13423          	sd	a3,104(sp)
    80001170:	06e13823          	sd	a4,112(sp)
    80001174:	06f13c23          	sd	a5,120(sp)
    80001178:	09013023          	sd	a6,128(sp)
    8000117c:	09113423          	sd	a7,136(sp)
    80001180:	09213823          	sd	s2,144(sp)
    80001184:	09313c23          	sd	s3,152(sp)
    80001188:	0b413023          	sd	s4,160(sp)
    8000118c:	0b513423          	sd	s5,168(sp)
    80001190:	0b613823          	sd	s6,176(sp)
    80001194:	0b713c23          	sd	s7,184(sp)
    80001198:	0d813023          	sd	s8,192(sp)
    8000119c:	0d913423          	sd	s9,200(sp)
    800011a0:	0da13823          	sd	s10,208(sp)
    800011a4:	0db13c23          	sd	s11,216(sp)
    800011a8:	0fc13023          	sd	t3,224(sp)
    800011ac:	0fd13423          	sd	t4,232(sp)
    800011b0:	0fe13823          	sd	t5,240(sp)
    800011b4:	0ff13c23          	sd	t6,248(sp)
    ret
    800011b8:	00008067          	ret

00000000800011bc <_ZN5Riscv12popRegistersEv>:
.global _ZN5Riscv12popRegistersEv
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011bc:	01813183          	ld	gp,24(sp)
    800011c0:	02013203          	ld	tp,32(sp)
    800011c4:	02813283          	ld	t0,40(sp)
    800011c8:	03013303          	ld	t1,48(sp)
    800011cc:	03813383          	ld	t2,56(sp)
    800011d0:	04013403          	ld	s0,64(sp)
    800011d4:	04813483          	ld	s1,72(sp)
    800011d8:	05013503          	ld	a0,80(sp)
    800011dc:	05813583          	ld	a1,88(sp)
    800011e0:	06013603          	ld	a2,96(sp)
    800011e4:	06813683          	ld	a3,104(sp)
    800011e8:	07013703          	ld	a4,112(sp)
    800011ec:	07813783          	ld	a5,120(sp)
    800011f0:	08013803          	ld	a6,128(sp)
    800011f4:	08813883          	ld	a7,136(sp)
    800011f8:	09013903          	ld	s2,144(sp)
    800011fc:	09813983          	ld	s3,152(sp)
    80001200:	0a013a03          	ld	s4,160(sp)
    80001204:	0a813a83          	ld	s5,168(sp)
    80001208:	0b013b03          	ld	s6,176(sp)
    8000120c:	0b813b83          	ld	s7,184(sp)
    80001210:	0c013c03          	ld	s8,192(sp)
    80001214:	0c813c83          	ld	s9,200(sp)
    80001218:	0d013d03          	ld	s10,208(sp)
    8000121c:	0d813d83          	ld	s11,216(sp)
    80001220:	0e013e03          	ld	t3,224(sp)
    80001224:	0e813e83          	ld	t4,232(sp)
    80001228:	0f013f03          	ld	t5,240(sp)
    8000122c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001230:	10010113          	addi	sp,sp,256
    ret
    80001234:	00008067          	ret

0000000080001238 <_ZN7ThreadK13contextSwitchEPNS_7ContextES1_>:
.global _ZN7ThreadK13contextSwitchEPNS_7ContextES1_
.type _ZN7ThreadK13contextSwitchEPNS_7ContextES1_, @function
_ZN7ThreadK13contextSwitchEPNS_7ContextES1_:
    #a0 = &old->context
    #a1 = &new->context
    sd ra, 0 * 8(a0)
    80001238:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    8000123c:	00253423          	sd	sp,8(a0)

     ld ra, 0 * 8(a1)
    80001240:	0005b083          	ld	ra,0(a1)
     ld sp, 1 * 8(a1)
    80001244:	0085b103          	ld	sp,8(a1)
    80001248:	00008067          	ret

000000008000124c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000124c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001250:	00b29a63          	bne	t0,a1,80001264 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001254:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001258:	fe029ae3          	bnez	t0,8000124c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000125c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001260:	00008067          	ret

0000000080001264 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001264:	00100513          	li	a0,1
    80001268:	00008067          	ret

000000008000126c <_Z9abiCalleriPm>:
//
// Created by os on 5/16/22.
//
#include "../h/syscall_c.h"

void* abiCaller(int code, uint64* args){//kad udjem ovde, u a1 mi se nalazi odgovarajuci argument
    8000126c:	ff010113          	addi	sp,sp,-16
    80001270:	00813423          	sd	s0,8(sp)
    80001274:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80001278:	00000073          	ecall
    void* retval;
    __asm__ volatile ("mv a0, %[ret]" : [ret] "=r" (retval));
    8000127c:	00050513          	mv	a0,a0
    return retval;
}
    80001280:	00813403          	ld	s0,8(sp)
    80001284:	01010113          	addi	sp,sp,16
    80001288:	00008067          	ret

000000008000128c <_Z9mem_allocm>:
void* mem_alloc (size_t size){
    8000128c:	fe010113          	addi	sp,sp,-32
    80001290:	00113c23          	sd	ra,24(sp)
    80001294:	00813823          	sd	s0,16(sp)
    80001298:	02010413          	addi	s0,sp,32
    int code = 0x01;
    size_t inBlocks = (size+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    8000129c:	03f50513          	addi	a0,a0,63
    800012a0:	00655513          	srli	a0,a0,0x6
    //stavljanje parametara u registre i zvanje ecall
    uint64 args[] = {inBlocks};
    800012a4:	fea43423          	sd	a0,-24(s0)
    return abiCaller(code, args);
    800012a8:	fe840593          	addi	a1,s0,-24
    800012ac:	00100513          	li	a0,1
    800012b0:	00000097          	auipc	ra,0x0
    800012b4:	fbc080e7          	jalr	-68(ra) # 8000126c <_Z9abiCalleriPm>
}
    800012b8:	01813083          	ld	ra,24(sp)
    800012bc:	01013403          	ld	s0,16(sp)
    800012c0:	02010113          	addi	sp,sp,32
    800012c4:	00008067          	ret

00000000800012c8 <_Z8mem_freePv>:

int mem_free (void* data){
    if(!data) return -1;
    800012c8:	04050463          	beqz	a0,80001310 <_Z8mem_freePv+0x48>
int mem_free (void* data){
    800012cc:	fe010113          	addi	sp,sp,-32
    800012d0:	00113c23          	sd	ra,24(sp)
    800012d4:	00813823          	sd	s0,16(sp)
    800012d8:	02010413          	addi	s0,sp,32
    int code = 0x02;
    uint64 args[] = {(uint64)data};
    800012dc:	fea43423          	sd	a0,-24(s0)
    void* returnval = abiCaller(code, args);
    800012e0:	fe840593          	addi	a1,s0,-24
    800012e4:	00200513          	li	a0,2
    800012e8:	00000097          	auipc	ra,0x0
    800012ec:	f84080e7          	jalr	-124(ra) # 8000126c <_Z9abiCalleriPm>
    return (returnval? -1:0);
    800012f0:	00051c63          	bnez	a0,80001308 <_Z8mem_freePv+0x40>
    800012f4:	00000513          	li	a0,0
}
    800012f8:	01813083          	ld	ra,24(sp)
    800012fc:	01013403          	ld	s0,16(sp)
    80001300:	02010113          	addi	sp,sp,32
    80001304:	00008067          	ret
    return (returnval? -1:0);
    80001308:	fff00513          	li	a0,-1
    8000130c:	fedff06f          	j	800012f8 <_Z8mem_freePv+0x30>
    if(!data) return -1;
    80001310:	fff00513          	li	a0,-1
}
    80001314:	00008067          	ret

0000000080001318 <_Z13thread_createPP7ThreadKPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg){
    80001318:	fb010113          	addi	sp,sp,-80
    8000131c:	04113423          	sd	ra,72(sp)
    80001320:	04813023          	sd	s0,64(sp)
    80001324:	02913c23          	sd	s1,56(sp)
    80001328:	03213823          	sd	s2,48(sp)
    8000132c:	03313423          	sd	s3,40(sp)
    80001330:	05010413          	addi	s0,sp,80
    80001334:	00050993          	mv	s3,a0
    80001338:	00058493          	mv	s1,a1
    8000133c:	00060913          	mv	s2,a2
    int code = 0x11;
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE*8);
    80001340:	00008537          	lui	a0,0x8
    80001344:	00000097          	auipc	ra,0x0
    80001348:	f48080e7          	jalr	-184(ra) # 8000128c <_Z9mem_allocm>
    if(!stack || start_routine == nullptr){
    8000134c:	04050a63          	beqz	a0,800013a0 <_Z13thread_createPP7ThreadKPFvPvES2_+0x88>
    80001350:	04048c63          	beqz	s1,800013a8 <_Z13thread_createPP7ThreadKPFvPvES2_+0x90>
        return -1;
    }
    uint64 args[] = {(uint64)handle, (uint64)start_routine, (uint64)arg, (uint64)stack};
    80001354:	fb343823          	sd	s3,-80(s0)
    80001358:	fa943c23          	sd	s1,-72(s0)
    8000135c:	fd243023          	sd	s2,-64(s0)
    80001360:	fca43423          	sd	a0,-56(s0)
    void* returnval = abiCaller(code, args);
    80001364:	fb040593          	addi	a1,s0,-80
    80001368:	01100513          	li	a0,17
    8000136c:	00000097          	auipc	ra,0x0
    80001370:	f00080e7          	jalr	-256(ra) # 8000126c <_Z9abiCalleriPm>
    return (returnval? -1: 0);
    80001374:	02051263          	bnez	a0,80001398 <_Z13thread_createPP7ThreadKPFvPvES2_+0x80>
    80001378:	00000513          	li	a0,0
}
    8000137c:	04813083          	ld	ra,72(sp)
    80001380:	04013403          	ld	s0,64(sp)
    80001384:	03813483          	ld	s1,56(sp)
    80001388:	03013903          	ld	s2,48(sp)
    8000138c:	02813983          	ld	s3,40(sp)
    80001390:	05010113          	addi	sp,sp,80
    80001394:	00008067          	ret
    return (returnval? -1: 0);
    80001398:	fff00513          	li	a0,-1
    8000139c:	fe1ff06f          	j	8000137c <_Z13thread_createPP7ThreadKPFvPvES2_+0x64>
        return -1;
    800013a0:	fff00513          	li	a0,-1
    800013a4:	fd9ff06f          	j	8000137c <_Z13thread_createPP7ThreadKPFvPvES2_+0x64>
    800013a8:	fff00513          	li	a0,-1
    800013ac:	fd1ff06f          	j	8000137c <_Z13thread_createPP7ThreadKPFvPvES2_+0x64>

00000000800013b0 <_Z15thread_dispatchv>:
void thread_dispatch (){
    800013b0:	ff010113          	addi	sp,sp,-16
    800013b4:	00113423          	sd	ra,8(sp)
    800013b8:	00813023          	sd	s0,0(sp)
    800013bc:	01010413          	addi	s0,sp,16
    int code = 0x13;
    uint64* args = 0;
    abiCaller(code, args);
    800013c0:	00000593          	li	a1,0
    800013c4:	01300513          	li	a0,19
    800013c8:	00000097          	auipc	ra,0x0
    800013cc:	ea4080e7          	jalr	-348(ra) # 8000126c <_Z9abiCalleriPm>
}
    800013d0:	00813083          	ld	ra,8(sp)
    800013d4:	00013403          	ld	s0,0(sp)
    800013d8:	01010113          	addi	sp,sp,16
    800013dc:	00008067          	ret

00000000800013e0 <_Z11thread_exitv>:

void thread_exit(){
    800013e0:	ff010113          	addi	sp,sp,-16
    800013e4:	00113423          	sd	ra,8(sp)
    800013e8:	00813023          	sd	s0,0(sp)
    800013ec:	01010413          	addi	s0,sp,16
    int code = 0x12;
    uint64* args = 0;
    abiCaller(code, args);
    800013f0:	00000593          	li	a1,0
    800013f4:	01200513          	li	a0,18
    800013f8:	00000097          	auipc	ra,0x0
    800013fc:	e74080e7          	jalr	-396(ra) # 8000126c <_Z9abiCalleriPm>
}
    80001400:	00813083          	ld	ra,8(sp)
    80001404:	00013403          	ld	s0,0(sp)
    80001408:	01010113          	addi	sp,sp,16
    8000140c:	00008067          	ret

0000000080001410 <_Z8sem_openPP10SemaphoreKj>:

int sem_open(sem_t *handle, unsigned init){
    80001410:	fe010113          	addi	sp,sp,-32
    80001414:	00113c23          	sd	ra,24(sp)
    80001418:	00813823          	sd	s0,16(sp)
    8000141c:	02010413          	addi	s0,sp,32
    int code = 0x21;
    uint64 args[] = {(uint64) handle, (uint64) init};
    80001420:	fea43023          	sd	a0,-32(s0)
    80001424:	02059593          	slli	a1,a1,0x20
    80001428:	0205d593          	srli	a1,a1,0x20
    8000142c:	feb43423          	sd	a1,-24(s0)
    void* retval = abiCaller(code, args);
    80001430:	fe040593          	addi	a1,s0,-32
    80001434:	02100513          	li	a0,33
    80001438:	00000097          	auipc	ra,0x0
    8000143c:	e34080e7          	jalr	-460(ra) # 8000126c <_Z9abiCalleriPm>
    return (retval? -1: 0);
    80001440:	00051c63          	bnez	a0,80001458 <_Z8sem_openPP10SemaphoreKj+0x48>
    80001444:	00000513          	li	a0,0
}
    80001448:	01813083          	ld	ra,24(sp)
    8000144c:	01013403          	ld	s0,16(sp)
    80001450:	02010113          	addi	sp,sp,32
    80001454:	00008067          	ret
    return (retval? -1: 0);
    80001458:	fff00513          	li	a0,-1
    8000145c:	fedff06f          	j	80001448 <_Z8sem_openPP10SemaphoreKj+0x38>

0000000080001460 <_Z9sem_closeP10SemaphoreK>:

int sem_close (sem_t handle){
    if(handle  == nullptr) return -1;
    80001460:	04050463          	beqz	a0,800014a8 <_Z9sem_closeP10SemaphoreK+0x48>
int sem_close (sem_t handle){
    80001464:	fe010113          	addi	sp,sp,-32
    80001468:	00113c23          	sd	ra,24(sp)
    8000146c:	00813823          	sd	s0,16(sp)
    80001470:	02010413          	addi	s0,sp,32
    int code = 0x22;
    uint64 args[] = {(uint64) handle};
    80001474:	fea43423          	sd	a0,-24(s0)
    void* retval = abiCaller(code, args);
    80001478:	fe840593          	addi	a1,s0,-24
    8000147c:	02200513          	li	a0,34
    80001480:	00000097          	auipc	ra,0x0
    80001484:	dec080e7          	jalr	-532(ra) # 8000126c <_Z9abiCalleriPm>
    return (retval? -1: 0);
    80001488:	00051c63          	bnez	a0,800014a0 <_Z9sem_closeP10SemaphoreK+0x40>
    8000148c:	00000513          	li	a0,0
}
    80001490:	01813083          	ld	ra,24(sp)
    80001494:	01013403          	ld	s0,16(sp)
    80001498:	02010113          	addi	sp,sp,32
    8000149c:	00008067          	ret
    return (retval? -1: 0);
    800014a0:	fff00513          	li	a0,-1
    800014a4:	fedff06f          	j	80001490 <_Z9sem_closeP10SemaphoreK+0x30>
    if(handle  == nullptr) return -1;
    800014a8:	fff00513          	li	a0,-1
}
    800014ac:	00008067          	ret

00000000800014b0 <_Z8sem_waitP10SemaphoreK>:

int sem_wait (sem_t id){
    if(id  == nullptr) return -1;
    800014b0:	04050463          	beqz	a0,800014f8 <_Z8sem_waitP10SemaphoreK+0x48>
int sem_wait (sem_t id){
    800014b4:	fe010113          	addi	sp,sp,-32
    800014b8:	00113c23          	sd	ra,24(sp)
    800014bc:	00813823          	sd	s0,16(sp)
    800014c0:	02010413          	addi	s0,sp,32
    int code = 0x23;
    uint64 args[] = {(uint64) id};
    800014c4:	fea43423          	sd	a0,-24(s0)
    void* retval = abiCaller(code, args);
    800014c8:	fe840593          	addi	a1,s0,-24
    800014cc:	02300513          	li	a0,35
    800014d0:	00000097          	auipc	ra,0x0
    800014d4:	d9c080e7          	jalr	-612(ra) # 8000126c <_Z9abiCalleriPm>
    return (retval? -1: 0);
    800014d8:	00051c63          	bnez	a0,800014f0 <_Z8sem_waitP10SemaphoreK+0x40>
    800014dc:	00000513          	li	a0,0
}
    800014e0:	01813083          	ld	ra,24(sp)
    800014e4:	01013403          	ld	s0,16(sp)
    800014e8:	02010113          	addi	sp,sp,32
    800014ec:	00008067          	ret
    return (retval? -1: 0);
    800014f0:	fff00513          	li	a0,-1
    800014f4:	fedff06f          	j	800014e0 <_Z8sem_waitP10SemaphoreK+0x30>
    if(id  == nullptr) return -1;
    800014f8:	fff00513          	li	a0,-1
}
    800014fc:	00008067          	ret

0000000080001500 <_Z10sem_signalP10SemaphoreK>:

int sem_signal (sem_t id){
    if(id  == nullptr) return -1;
    80001500:	04050463          	beqz	a0,80001548 <_Z10sem_signalP10SemaphoreK+0x48>
int sem_signal (sem_t id){
    80001504:	fe010113          	addi	sp,sp,-32
    80001508:	00113c23          	sd	ra,24(sp)
    8000150c:	00813823          	sd	s0,16(sp)
    80001510:	02010413          	addi	s0,sp,32
    int code = 0x24;
    uint64 args[] = {(uint64) id};
    80001514:	fea43423          	sd	a0,-24(s0)
    void* retval = abiCaller(code, args);
    80001518:	fe840593          	addi	a1,s0,-24
    8000151c:	02400513          	li	a0,36
    80001520:	00000097          	auipc	ra,0x0
    80001524:	d4c080e7          	jalr	-692(ra) # 8000126c <_Z9abiCalleriPm>
    return (retval? -1: 0);
    80001528:	00051c63          	bnez	a0,80001540 <_Z10sem_signalP10SemaphoreK+0x40>
    8000152c:	00000513          	li	a0,0
}
    80001530:	01813083          	ld	ra,24(sp)
    80001534:	01013403          	ld	s0,16(sp)
    80001538:	02010113          	addi	sp,sp,32
    8000153c:	00008067          	ret
    return (retval? -1: 0);
    80001540:	fff00513          	li	a0,-1
    80001544:	fedff06f          	j	80001530 <_Z10sem_signalP10SemaphoreK+0x30>
    if(id  == nullptr) return -1;
    80001548:	fff00513          	li	a0,-1
}
    8000154c:	00008067          	ret

0000000080001550 <_Z10time_sleepm>:

int time_sleep (time_t time){
    80001550:	fe010113          	addi	sp,sp,-32
    80001554:	00113c23          	sd	ra,24(sp)
    80001558:	00813823          	sd	s0,16(sp)
    8000155c:	02010413          	addi	s0,sp,32
    int code = 0x31;
    uint64 args[] = {(uint64)time};
    80001560:	fea43423          	sd	a0,-24(s0)
    void* retval = abiCaller(code, args);
    80001564:	fe840593          	addi	a1,s0,-24
    80001568:	03100513          	li	a0,49
    8000156c:	00000097          	auipc	ra,0x0
    80001570:	d00080e7          	jalr	-768(ra) # 8000126c <_Z9abiCalleriPm>
    return (retval? -1: 0);
    80001574:	00051c63          	bnez	a0,8000158c <_Z10time_sleepm+0x3c>
    80001578:	00000513          	li	a0,0
}
    8000157c:	01813083          	ld	ra,24(sp)
    80001580:	01013403          	ld	s0,16(sp)
    80001584:	02010113          	addi	sp,sp,32
    80001588:	00008067          	ret
    return (retval? -1: 0);
    8000158c:	fff00513          	li	a0,-1
    80001590:	fedff06f          	j	8000157c <_Z10time_sleepm+0x2c>

0000000080001594 <_Z4getcv>:

char getc (){
    80001594:	ff010113          	addi	sp,sp,-16
    80001598:	00113423          	sd	ra,8(sp)
    8000159c:	00813023          	sd	s0,0(sp)
    800015a0:	01010413          	addi	s0,sp,16
    int code = 0x41;
    uint64* args = 0;
    void* retval = abiCaller(code, args);
    800015a4:	00000593          	li	a1,0
    800015a8:	04100513          	li	a0,65
    800015ac:	00000097          	auipc	ra,0x0
    800015b0:	cc0080e7          	jalr	-832(ra) # 8000126c <_Z9abiCalleriPm>
    return (char)((uint64)retval);
}
    800015b4:	0ff57513          	andi	a0,a0,255
    800015b8:	00813083          	ld	ra,8(sp)
    800015bc:	00013403          	ld	s0,0(sp)
    800015c0:	01010113          	addi	sp,sp,16
    800015c4:	00008067          	ret

00000000800015c8 <_Z4putcc>:

void putc (char c){
    800015c8:	fe010113          	addi	sp,sp,-32
    800015cc:	00113c23          	sd	ra,24(sp)
    800015d0:	00813823          	sd	s0,16(sp)
    800015d4:	02010413          	addi	s0,sp,32
    int code = 0x42;
    uint64 args[] = {(uint64)c};
    800015d8:	fea43423          	sd	a0,-24(s0)
    abiCaller(code, args);
    800015dc:	fe840593          	addi	a1,s0,-24
    800015e0:	04200513          	li	a0,66
    800015e4:	00000097          	auipc	ra,0x0
    800015e8:	c88080e7          	jalr	-888(ra) # 8000126c <_Z9abiCalleriPm>
}
    800015ec:	01813083          	ld	ra,24(sp)
    800015f0:	01013403          	ld	s0,16(sp)
    800015f4:	02010113          	addi	sp,sp,32
    800015f8:	00008067          	ret

00000000800015fc <_Z18thread_create_onlyPP7ThreadKPFvPvES2_>:

int thread_create_only(thread_t *handle, void (*start_routine)(void *), void *arg) {
    800015fc:	fb010113          	addi	sp,sp,-80
    80001600:	04113423          	sd	ra,72(sp)
    80001604:	04813023          	sd	s0,64(sp)
    80001608:	02913c23          	sd	s1,56(sp)
    8000160c:	03213823          	sd	s2,48(sp)
    80001610:	03313423          	sd	s3,40(sp)
    80001614:	05010413          	addi	s0,sp,80
    80001618:	00050993          	mv	s3,a0
    8000161c:	00058913          	mv	s2,a1
    80001620:	00060493          	mv	s1,a2
    int code = 0x14;
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE*8);
    80001624:	00008537          	lui	a0,0x8
    80001628:	00000097          	auipc	ra,0x0
    8000162c:	c64080e7          	jalr	-924(ra) # 8000128c <_Z9mem_allocm>
    if(!stack){
    80001630:	04050863          	beqz	a0,80001680 <_Z18thread_create_onlyPP7ThreadKPFvPvES2_+0x84>
        return -1;
    }
    uint64 args[] = {(uint64)handle, (uint64)start_routine, (uint64)arg, (uint64)stack};
    80001634:	fb343823          	sd	s3,-80(s0)
    80001638:	fb243c23          	sd	s2,-72(s0)
    8000163c:	fc943023          	sd	s1,-64(s0)
    80001640:	fca43423          	sd	a0,-56(s0)
    void* returnval = abiCaller(code, args);
    80001644:	fb040593          	addi	a1,s0,-80
    80001648:	01400513          	li	a0,20
    8000164c:	00000097          	auipc	ra,0x0
    80001650:	c20080e7          	jalr	-992(ra) # 8000126c <_Z9abiCalleriPm>
    return (returnval? -1: 0);
    80001654:	02051263          	bnez	a0,80001678 <_Z18thread_create_onlyPP7ThreadKPFvPvES2_+0x7c>
    80001658:	00000513          	li	a0,0
}
    8000165c:	04813083          	ld	ra,72(sp)
    80001660:	04013403          	ld	s0,64(sp)
    80001664:	03813483          	ld	s1,56(sp)
    80001668:	03013903          	ld	s2,48(sp)
    8000166c:	02813983          	ld	s3,40(sp)
    80001670:	05010113          	addi	sp,sp,80
    80001674:	00008067          	ret
    return (returnval? -1: 0);
    80001678:	fff00513          	li	a0,-1
    8000167c:	fe1ff06f          	j	8000165c <_Z18thread_create_onlyPP7ThreadKPFvPvES2_+0x60>
        return -1;
    80001680:	fff00513          	li	a0,-1
    80001684:	fd9ff06f          	j	8000165c <_Z18thread_create_onlyPP7ThreadKPFvPvES2_+0x60>

0000000080001688 <_Z12thread_startP7ThreadK>:

int thread_start(thread_t handle) {
    80001688:	fe010113          	addi	sp,sp,-32
    8000168c:	00113c23          	sd	ra,24(sp)
    80001690:	00813823          	sd	s0,16(sp)
    80001694:	02010413          	addi	s0,sp,32
    int code = 0x15;
    uint64 args[] = {(uint64)handle};
    80001698:	fea43423          	sd	a0,-24(s0)
    void* returnval = abiCaller(code, args);
    8000169c:	fe840593          	addi	a1,s0,-24
    800016a0:	01500513          	li	a0,21
    800016a4:	00000097          	auipc	ra,0x0
    800016a8:	bc8080e7          	jalr	-1080(ra) # 8000126c <_Z9abiCalleriPm>
    return (returnval? -1: 0);
    800016ac:	00051c63          	bnez	a0,800016c4 <_Z12thread_startP7ThreadK+0x3c>
    800016b0:	00000513          	li	a0,0
}
    800016b4:	01813083          	ld	ra,24(sp)
    800016b8:	01013403          	ld	s0,16(sp)
    800016bc:	02010113          	addi	sp,sp,32
    800016c0:	00008067          	ret
    return (returnval? -1: 0);
    800016c4:	fff00513          	li	a0,-1
    800016c8:	fedff06f          	j	800016b4 <_Z12thread_startP7ThreadK+0x2c>

00000000800016cc <_ZN7ThreadK13threadWrapperEv>:

void ThreadK::operator delete[](void *p) {
    MemoryAllocator::kmem_free(p);
}

void ThreadK::threadWrapper() {
    800016cc:	ff010113          	addi	sp,sp,-16
    800016d0:	00113423          	sd	ra,8(sp)
    800016d4:	00813023          	sd	s0,0(sp)
    800016d8:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    800016dc:	00002097          	auipc	ra,0x2
    800016e0:	f88080e7          	jalr	-120(ra) # 80003664 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arguments);
    800016e4:	00007797          	auipc	a5,0x7
    800016e8:	2ec7b783          	ld	a5,748(a5) # 800089d0 <_ZN7ThreadK7runningE>
    800016ec:	0007b703          	ld	a4,0(a5)
    800016f0:	0387b503          	ld	a0,56(a5)
    800016f4:	000700e7          	jalr	a4
    thread_exit();
    800016f8:	00000097          	auipc	ra,0x0
    800016fc:	ce8080e7          	jalr	-792(ra) # 800013e0 <_Z11thread_exitv>
}
    80001700:	00813083          	ld	ra,8(sp)
    80001704:	00013403          	ld	s0,0(sp)
    80001708:	01010113          	addi	sp,sp,16
    8000170c:	00008067          	ret

0000000080001710 <_ZN7ThreadK8dispatchEv>:
void ThreadK::dispatch() {
    80001710:	fe010113          	addi	sp,sp,-32
    80001714:	00113c23          	sd	ra,24(sp)
    80001718:	00813823          	sd	s0,16(sp)
    8000171c:	00913423          	sd	s1,8(sp)
    80001720:	02010413          	addi	s0,sp,32
    ThreadK* old = running;
    80001724:	00007497          	auipc	s1,0x7
    80001728:	2ac4b483          	ld	s1,684(s1) # 800089d0 <_ZN7ThreadK7runningE>
    using Body = void (*)(void*);
    ~ThreadK();
    static ThreadK *createThread(Body body, void *arg, uint64 *userStck, bool sysThread, bool createOnly);

    bool isFinished() const {
        return finished;
    8000172c:	0184c783          	lbu	a5,24(s1)
    if(!old->isFinished() && !old->onSleep && old->blockedOnWait == 0){
    80001730:	00079a63          	bnez	a5,80001744 <_ZN7ThreadK8dispatchEv+0x34>
    80001734:	0724c783          	lbu	a5,114(s1)
    80001738:	00079663          	bnez	a5,80001744 <_ZN7ThreadK8dispatchEv+0x34>
    8000173c:	0704c783          	lbu	a5,112(s1)
    80001740:	02078c63          	beqz	a5,80001778 <_ZN7ThreadK8dispatchEv+0x68>
    running = Scheduler::get();
    80001744:	00000097          	auipc	ra,0x0
    80001748:	60c080e7          	jalr	1548(ra) # 80001d50 <_ZN9Scheduler3getEv>
    8000174c:	00007797          	auipc	a5,0x7
    80001750:	28a7b223          	sd	a0,644(a5) # 800089d0 <_ZN7ThreadK7runningE>
    contextSwitch(&old->context, &running->context);
    80001754:	00850593          	addi	a1,a0,8 # 8008 <_entry-0x7fff7ff8>
    80001758:	00848513          	addi	a0,s1,8
    8000175c:	00000097          	auipc	ra,0x0
    80001760:	adc080e7          	jalr	-1316(ra) # 80001238 <_ZN7ThreadK13contextSwitchEPNS_7ContextES1_>
}
    80001764:	01813083          	ld	ra,24(sp)
    80001768:	01013403          	ld	s0,16(sp)
    8000176c:	00813483          	ld	s1,8(sp)
    80001770:	02010113          	addi	sp,sp,32
    80001774:	00008067          	ret
        Scheduler::put(old);
    80001778:	00048513          	mv	a0,s1
    8000177c:	00000097          	auipc	ra,0x0
    80001780:	680080e7          	jalr	1664(ra) # 80001dfc <_ZN9Scheduler3putEP7ThreadK>
    80001784:	fc1ff06f          	j	80001744 <_ZN7ThreadK8dispatchEv+0x34>

0000000080001788 <_ZN7ThreadK5yieldEv>:
void ThreadK::yield() {
    80001788:	fd010113          	addi	sp,sp,-48
    8000178c:	02113423          	sd	ra,40(sp)
    80001790:	02813023          	sd	s0,32(sp)
    80001794:	03010413          	addi	s0,sp,48
    __asm__ volatile("csrw scause, %[scause]": : [scause] "r" (scause));
}

inline uint64 Riscv::r_sepc() {
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" :  [sepc] "=r" (sepc));
    80001798:	141027f3          	csrr	a5,sepc
    8000179c:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800017a0:	fd843783          	ld	a5,-40(s0)
    uint64 volatile sepc = Riscv::r_sepc() + 4;
    800017a4:	00478793          	addi	a5,a5,4
    800017a8:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile("csrc sip, %[mask]" : : [mask] "r" (mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" :  [sstatus] "=r" (sstatus));
    800017ac:	100027f3          	csrr	a5,sstatus
    800017b0:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    800017b4:	fd043783          	ld	a5,-48(s0)
    uint64 volatile sstatus = Riscv::r_sstatus();
    800017b8:	fef43023          	sd	a5,-32(s0)
    ThreadK::timeSliceCounter = 0;
    800017bc:	00007797          	auipc	a5,0x7
    800017c0:	2007be23          	sd	zero,540(a5) # 800089d8 <_ZN7ThreadK16timeSliceCounterE>
    ThreadK::dispatch();
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	f4c080e7          	jalr	-180(ra) # 80001710 <_ZN7ThreadK8dispatchEv>
    Riscv::w_sstatus(sstatus);
    800017cc:	fe043783          	ld	a5,-32(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r" (sstatus));
    800017d0:	10079073          	csrw	sstatus,a5
    Riscv::w_sepc(sepc);
    800017d4:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r" (sepc));
    800017d8:	14179073          	csrw	sepc,a5
}
    800017dc:	02813083          	ld	ra,40(sp)
    800017e0:	02013403          	ld	s0,32(sp)
    800017e4:	03010113          	addi	sp,sp,48
    800017e8:	00008067          	ret

00000000800017ec <_ZN7ThreadKnwEm>:
void *ThreadK::operator new(size_t size) {
    800017ec:	ff010113          	addi	sp,sp,-16
    800017f0:	00113423          	sd	ra,8(sp)
    800017f4:	00813023          	sd	s0,0(sp)
    800017f8:	01010413          	addi	s0,sp,16
    return MemoryAllocator::kmem_alloc(size);
    800017fc:	00002097          	auipc	ra,0x2
    80001800:	f64080e7          	jalr	-156(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
}
    80001804:	00813083          	ld	ra,8(sp)
    80001808:	00013403          	ld	s0,0(sp)
    8000180c:	01010113          	addi	sp,sp,16
    80001810:	00008067          	ret

0000000080001814 <_ZN7ThreadKdlEPv>:
void ThreadK::operator delete(void *p) {
    80001814:	ff010113          	addi	sp,sp,-16
    80001818:	00113423          	sd	ra,8(sp)
    8000181c:	00813023          	sd	s0,0(sp)
    80001820:	01010413          	addi	s0,sp,16
    MemoryAllocator::kmem_free(p);
    80001824:	00002097          	auipc	ra,0x2
    80001828:	0a0080e7          	jalr	160(ra) # 800038c4 <_ZN15MemoryAllocator9kmem_freeEPv>
}
    8000182c:	00813083          	ld	ra,8(sp)
    80001830:	00013403          	ld	s0,0(sp)
    80001834:	01010113          	addi	sp,sp,16
    80001838:	00008067          	ret

000000008000183c <_ZN7ThreadKnaEm>:
void *ThreadK::operator new[](size_t size) {
    8000183c:	ff010113          	addi	sp,sp,-16
    80001840:	00113423          	sd	ra,8(sp)
    80001844:	00813023          	sd	s0,0(sp)
    80001848:	01010413          	addi	s0,sp,16
    return MemoryAllocator::kmem_alloc(size);
    8000184c:	00002097          	auipc	ra,0x2
    80001850:	f14080e7          	jalr	-236(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
}
    80001854:	00813083          	ld	ra,8(sp)
    80001858:	00013403          	ld	s0,0(sp)
    8000185c:	01010113          	addi	sp,sp,16
    80001860:	00008067          	ret

0000000080001864 <_ZN7ThreadKdaEPv>:
void ThreadK::operator delete[](void *p) {
    80001864:	ff010113          	addi	sp,sp,-16
    80001868:	00113423          	sd	ra,8(sp)
    8000186c:	00813023          	sd	s0,0(sp)
    80001870:	01010413          	addi	s0,sp,16
    MemoryAllocator::kmem_free(p);
    80001874:	00002097          	auipc	ra,0x2
    80001878:	050080e7          	jalr	80(ra) # 800038c4 <_ZN15MemoryAllocator9kmem_freeEPv>
}
    8000187c:	00813083          	ld	ra,8(sp)
    80001880:	00013403          	ld	s0,0(sp)
    80001884:	01010113          	addi	sp,sp,16
    80001888:	00008067          	ret

000000008000188c <_ZN7ThreadK10putToSleepEm>:

void ThreadK::putToSleep(uint64 time) {
    8000188c:	ff010113          	addi	sp,sp,-16
    80001890:	00813423          	sd	s0,8(sp)
    80001894:	01010413          	addi	s0,sp,16
    running->onSleep = true;
    80001898:	00007797          	auipc	a5,0x7
    8000189c:	13878793          	addi	a5,a5,312 # 800089d0 <_ZN7ThreadK7runningE>
    800018a0:	0007b603          	ld	a2,0(a5)
    800018a4:	00100713          	li	a4,1
    800018a8:	06e60923          	sb	a4,114(a2)
    if(!sleepHead){
    800018ac:	0107b783          	ld	a5,16(a5)
    800018b0:	02078e63          	beqz	a5,800018ec <_ZN7ThreadK10putToSleepEm+0x60>
        running->nextThread = nullptr;
        sleepHead = running;
    }
    else{
        //slozeno umetanje u listu prema vremenu budjenja
        uint64 firstST = sleepHead->sleepTime;
    800018b4:	0687b683          	ld	a3,104(a5)
        //insert first in list
        if(time < firstST){
    800018b8:	04d57863          	bgeu	a0,a3,80001908 <_ZN7ThreadK10putToSleepEm+0x7c>
            running->sleepTime = time;
    800018bc:	06a63423          	sd	a0,104(a2)
            sleepHead->sleepTime = sleepHead->sleepTime - time;
    800018c0:	0687b703          	ld	a4,104(a5)
    800018c4:	40a70533          	sub	a0,a4,a0
    800018c8:	06a7b423          	sd	a0,104(a5)
            running->nextThread = sleepHead;
    800018cc:	02f63023          	sd	a5,32(a2)
            running->prevThread = nullptr;
    800018d0:	02063423          	sd	zero,40(a2)
            sleepHead->prevThread = running;
    800018d4:	02c7b423          	sd	a2,40(a5)
            sleepHead = running;
    800018d8:	00007797          	auipc	a5,0x7
    800018dc:	10c7b423          	sd	a2,264(a5) # 800089e0 <_ZN7ThreadK9sleepHeadE>
            running->prevThread = tmp;
            running->sleepTime = time - timeOfSleepTmp;
        }
    }
    //after this i got dispatch
}
    800018e0:	00813403          	ld	s0,8(sp)
    800018e4:	01010113          	addi	sp,sp,16
    800018e8:	00008067          	ret
        running->sleepTime = time;
    800018ec:	06a63423          	sd	a0,104(a2)
        running->prevThread = nullptr;
    800018f0:	02063423          	sd	zero,40(a2)
        running->nextThread = nullptr;
    800018f4:	02063023          	sd	zero,32(a2)
        sleepHead = running;
    800018f8:	00007797          	auipc	a5,0x7
    800018fc:	0ec7b423          	sd	a2,232(a5) # 800089e0 <_ZN7ThreadK9sleepHeadE>
    80001900:	fe1ff06f          	j	800018e0 <_ZN7ThreadK10putToSleepEm+0x54>
                timeOfSleepTmp += tmp->sleepTime;
    80001904:	00070693          	mv	a3,a4
            while (tmp->nextThread && tmp->nextThread->sleepTime + timeOfSleepTmp <= time) {
    80001908:	00078593          	mv	a1,a5
    8000190c:	0207b783          	ld	a5,32(a5)
    80001910:	00078863          	beqz	a5,80001920 <_ZN7ThreadK10putToSleepEm+0x94>
    80001914:	0687b703          	ld	a4,104(a5)
    80001918:	00d70733          	add	a4,a4,a3
    8000191c:	fee574e3          	bgeu	a0,a4,80001904 <_ZN7ThreadK10putToSleepEm+0x78>
            running->nextThread = tmp->nextThread;
    80001920:	02f63023          	sd	a5,32(a2)
            if(running->nextThread) running->nextThread->prevThread = running;
    80001924:	00078463          	beqz	a5,8000192c <_ZN7ThreadK10putToSleepEm+0xa0>
    80001928:	02c7b423          	sd	a2,40(a5)
            tmp->nextThread = running;
    8000192c:	02c5b023          	sd	a2,32(a1)
            running->prevThread = tmp;
    80001930:	02b63423          	sd	a1,40(a2)
            running->sleepTime = time - timeOfSleepTmp;
    80001934:	40d50533          	sub	a0,a0,a3
    80001938:	06a63423          	sd	a0,104(a2)
}
    8000193c:	fa5ff06f          	j	800018e0 <_ZN7ThreadK10putToSleepEm+0x54>

0000000080001940 <_ZN7ThreadK5awakeEv>:
void ThreadK::awake() {
    ThreadK* tmp = sleepHead;
    80001940:	00007517          	auipc	a0,0x7
    80001944:	0a053503          	ld	a0,160(a0) # 800089e0 <_ZN7ThreadK9sleepHeadE>
    while(tmp && tmp->sleepTime == 0){
    80001948:	06050c63          	beqz	a0,800019c0 <_ZN7ThreadK5awakeEv+0x80>
    8000194c:	06853783          	ld	a5,104(a0)
    80001950:	06079863          	bnez	a5,800019c0 <_ZN7ThreadK5awakeEv+0x80>
void ThreadK::awake() {
    80001954:	fe010113          	addi	sp,sp,-32
    80001958:	00113c23          	sd	ra,24(sp)
    8000195c:	00813823          	sd	s0,16(sp)
    80001960:	00913423          	sd	s1,8(sp)
    80001964:	02010413          	addi	s0,sp,32
    80001968:	0340006f          	j	8000199c <_ZN7ThreadK5awakeEv+0x5c>
        ThreadK* tmp2 = tmp->nextThread;
        if(tmp->nextThread) tmp->nextThread->prevThread = nullptr;
        sleepHead = tmp->nextThread;
    8000196c:	02053783          	ld	a5,32(a0)
    80001970:	00007717          	auipc	a4,0x7
    80001974:	06f73823          	sd	a5,112(a4) # 800089e0 <_ZN7ThreadK9sleepHeadE>
        tmp->prevThread = nullptr;
    80001978:	02053423          	sd	zero,40(a0)
        tmp->nextThread = nullptr;
    8000197c:	02053023          	sd	zero,32(a0)
        tmp->onSleep = false;
    80001980:	06050923          	sb	zero,114(a0)
        Scheduler::put(tmp);
    80001984:	00000097          	auipc	ra,0x0
    80001988:	478080e7          	jalr	1144(ra) # 80001dfc <_ZN9Scheduler3putEP7ThreadK>
        tmp = tmp2;
    8000198c:	00048513          	mv	a0,s1
    while(tmp && tmp->sleepTime == 0){
    80001990:	00048e63          	beqz	s1,800019ac <_ZN7ThreadK5awakeEv+0x6c>
    80001994:	0684b783          	ld	a5,104(s1)
    80001998:	00079a63          	bnez	a5,800019ac <_ZN7ThreadK5awakeEv+0x6c>
        ThreadK* tmp2 = tmp->nextThread;
    8000199c:	02053483          	ld	s1,32(a0)
        if(tmp->nextThread) tmp->nextThread->prevThread = nullptr;
    800019a0:	fc0486e3          	beqz	s1,8000196c <_ZN7ThreadK5awakeEv+0x2c>
    800019a4:	0204b423          	sd	zero,40(s1)
    800019a8:	fc5ff06f          	j	8000196c <_ZN7ThreadK5awakeEv+0x2c>
    }
}
    800019ac:	01813083          	ld	ra,24(sp)
    800019b0:	01013403          	ld	s0,16(sp)
    800019b4:	00813483          	ld	s1,8(sp)
    800019b8:	02010113          	addi	sp,sp,32
    800019bc:	00008067          	ret
    800019c0:	00008067          	ret

00000000800019c4 <_ZN7ThreadK4joinEv>:

uint64 ThreadK ::userStackASM = OFFSETOF(ThreadK, userStack);
uint64 ThreadK ::kernelStackASM = OFFSETOF(ThreadK, kernelStack);

int ThreadK::join() {
    800019c4:	ff010113          	addi	sp,sp,-16
    800019c8:	00113423          	sd	ra,8(sp)
    800019cc:	00813023          	sd	s0,0(sp)
    800019d0:	01010413          	addi	s0,sp,16
    return this->thread_sem->wait();
    800019d4:	07853503          	ld	a0,120(a0)
    800019d8:	00053783          	ld	a5,0(a0)
    800019dc:	0107b783          	ld	a5,16(a5)
    800019e0:	000780e7          	jalr	a5
}
    800019e4:	00813083          	ld	ra,8(sp)
    800019e8:	00013403          	ld	s0,0(sp)
    800019ec:	01010113          	addi	sp,sp,16
    800019f0:	00008067          	ret

00000000800019f4 <_ZN7ThreadKC1EPFvPvES0_Pmmbb>:

ThreadK::ThreadK(ThreadK::Body b, void *arg, uint64 *userStck, uint64 tSlice, bool sysThread, bool createOnly) {
    800019f4:	fb010113          	addi	sp,sp,-80
    800019f8:	04113423          	sd	ra,72(sp)
    800019fc:	04813023          	sd	s0,64(sp)
    80001a00:	02913c23          	sd	s1,56(sp)
    80001a04:	03213823          	sd	s2,48(sp)
    80001a08:	03313423          	sd	s3,40(sp)
    80001a0c:	03413023          	sd	s4,32(sp)
    80001a10:	01513c23          	sd	s5,24(sp)
    80001a14:	01613823          	sd	s6,16(sp)
    80001a18:	01713423          	sd	s7,8(sp)
    80001a1c:	05010413          	addi	s0,sp,80
    80001a20:	00050493          	mv	s1,a0
    80001a24:	00058993          	mv	s3,a1
    80001a28:	00060b93          	mv	s7,a2
    80001a2c:	00068913          	mv	s2,a3
    80001a30:	00070a13          	mv	s4,a4
    80001a34:	00078b13          	mv	s6,a5
    80001a38:	00080a93          	mv	s5,a6
    80001a3c:	06050023          	sb	zero,96(a0)
    80001a40:	06053423          	sd	zero,104(a0)
    80001a44:	06050823          	sb	zero,112(a0)
    80001a48:	06050923          	sb	zero,114(a0)
    body = b;
    80001a4c:	00b53023          	sd	a1,0(a0)
    begKernel = kernelStack = (uint64*) MemoryAllocator::kmem_alloc(DEFAULT_STACK_SIZE*sizeof(uint64));
    80001a50:	00008537          	lui	a0,0x8
    80001a54:	00002097          	auipc	ra,0x2
    80001a58:	d0c080e7          	jalr	-756(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
    80001a5c:	04a4b823          	sd	a0,80(s1)
    begUser = userStck;
    80001a60:	0524bc23          	sd	s2,88(s1)
    kernelStack = &kernelStack[DEFAULT_STACK_SIZE];
    80001a64:	000087b7          	lui	a5,0x8
    80001a68:	00f50533          	add	a0,a0,a5
    80001a6c:	04a4b023          	sd	a0,64(s1)
    userStack = (b != nullptr) ? &userStck[DEFAULT_STACK_SIZE] : 0;
    80001a70:	0a098463          	beqz	s3,80001b18 <_ZN7ThreadKC1EPFvPvES0_Pmmbb+0x124>
    80001a74:	000086b7          	lui	a3,0x8
    80001a78:	00d906b3          	add	a3,s2,a3
    80001a7c:	04d4b423          	sd	a3,72(s1)
    context = {
    80001a80:	00000797          	auipc	a5,0x0
    80001a84:	c4c78793          	addi	a5,a5,-948 # 800016cc <_ZN7ThreadK13threadWrapperEv>
    80001a88:	00f4b423          	sd	a5,8(s1)
    80001a8c:	00d4b823          	sd	a3,16(s1)
            (uint64)&threadWrapper,
            userStack != nullptr ? (uint64)userStack : 0
    };
    timeSlice = (body==Scheduler::idle)?1:tSlice;
    80001a90:	0004b703          	ld	a4,0(s1)
    80001a94:	00007797          	auipc	a5,0x7
    80001a98:	ea47b783          	ld	a5,-348(a5) # 80008938 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001a9c:	08f70263          	beq	a4,a5,80001b20 <_ZN7ThreadKC1EPFvPvES0_Pmmbb+0x12c>
    80001aa0:	0344b823          	sd	s4,48(s1)
    arguments = arg;
    80001aa4:	0374bc23          	sd	s7,56(s1)
    finished = false;
    80001aa8:	00048c23          	sb	zero,24(s1)
    nextThread = nullptr;
    80001aac:	0204b023          	sd	zero,32(s1)
    prevThread = nullptr;
    80001ab0:	0204b423          	sd	zero,40(s1)
    systemThread = sysThread;
    80001ab4:	076488a3          	sb	s6,113(s1)
    thread_sem = new SemaphoreK(0);
    80001ab8:	02000513          	li	a0,32
    80001abc:	00001097          	auipc	ra,0x1
    80001ac0:	98c080e7          	jalr	-1652(ra) # 80002448 <_ZN10SemaphoreKnwEm>

#include "../h/ThreadK.hpp"

class SemaphoreK {
public:
    SemaphoreK(int val = 1): value(val){}
    80001ac4:	00007797          	auipc	a5,0x7
    80001ac8:	e6c7b783          	ld	a5,-404(a5) # 80008930 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001acc:	01078793          	addi	a5,a5,16
    80001ad0:	00f53023          	sd	a5,0(a0) # 8000 <_entry-0x7fff8000>
    80001ad4:	00052423          	sw	zero,8(a0)
    80001ad8:	00053823          	sd	zero,16(a0)
    80001adc:	00053c23          	sd	zero,24(a0)
    80001ae0:	06a4bc23          	sd	a0,120(s1)
    if(b != nullptr && !createOnly) Scheduler::put(this);
    80001ae4:	00098463          	beqz	s3,80001aec <_ZN7ThreadKC1EPFvPvES0_Pmmbb+0xf8>
    80001ae8:	040a8063          	beqz	s5,80001b28 <_ZN7ThreadKC1EPFvPvES0_Pmmbb+0x134>
}
    80001aec:	04813083          	ld	ra,72(sp)
    80001af0:	04013403          	ld	s0,64(sp)
    80001af4:	03813483          	ld	s1,56(sp)
    80001af8:	03013903          	ld	s2,48(sp)
    80001afc:	02813983          	ld	s3,40(sp)
    80001b00:	02013a03          	ld	s4,32(sp)
    80001b04:	01813a83          	ld	s5,24(sp)
    80001b08:	01013b03          	ld	s6,16(sp)
    80001b0c:	00813b83          	ld	s7,8(sp)
    80001b10:	05010113          	addi	sp,sp,80
    80001b14:	00008067          	ret
    userStack = (b != nullptr) ? &userStck[DEFAULT_STACK_SIZE] : 0;
    80001b18:	00000693          	li	a3,0
    80001b1c:	f61ff06f          	j	80001a7c <_ZN7ThreadKC1EPFvPvES0_Pmmbb+0x88>
    timeSlice = (body==Scheduler::idle)?1:tSlice;
    80001b20:	00100a13          	li	s4,1
    80001b24:	f7dff06f          	j	80001aa0 <_ZN7ThreadKC1EPFvPvES0_Pmmbb+0xac>
    if(b != nullptr && !createOnly) Scheduler::put(this);
    80001b28:	00048513          	mv	a0,s1
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	2d0080e7          	jalr	720(ra) # 80001dfc <_ZN9Scheduler3putEP7ThreadK>
}
    80001b34:	fb9ff06f          	j	80001aec <_ZN7ThreadKC1EPFvPvES0_Pmmbb+0xf8>

0000000080001b38 <_ZN7ThreadK12createThreadEPFvPvES0_Pmbb>:
ThreadK *ThreadK::createThread(Body body, void *arg, uint64 *userStck, bool sysThread, bool createOnly) {
    80001b38:	fc010113          	addi	sp,sp,-64
    80001b3c:	02113c23          	sd	ra,56(sp)
    80001b40:	02813823          	sd	s0,48(sp)
    80001b44:	02913423          	sd	s1,40(sp)
    80001b48:	03213023          	sd	s2,32(sp)
    80001b4c:	01313c23          	sd	s3,24(sp)
    80001b50:	01413823          	sd	s4,16(sp)
    80001b54:	01513423          	sd	s5,8(sp)
    80001b58:	01613023          	sd	s6,0(sp)
    80001b5c:	04010413          	addi	s0,sp,64
    80001b60:	00050913          	mv	s2,a0
    80001b64:	00058993          	mv	s3,a1
    80001b68:	00060a13          	mv	s4,a2
    80001b6c:	00068a93          	mv	s5,a3
    80001b70:	00070b13          	mv	s6,a4
    return new ThreadK(body, arg, userStck, DEFAULT_TIME_SLICE, sysThread, createOnly);
    80001b74:	08000513          	li	a0,128
    80001b78:	00000097          	auipc	ra,0x0
    80001b7c:	c74080e7          	jalr	-908(ra) # 800017ec <_ZN7ThreadKnwEm>
    80001b80:	00050493          	mv	s1,a0
    80001b84:	000b0813          	mv	a6,s6
    80001b88:	000a8793          	mv	a5,s5
    80001b8c:	00200713          	li	a4,2
    80001b90:	000a0693          	mv	a3,s4
    80001b94:	00098613          	mv	a2,s3
    80001b98:	00090593          	mv	a1,s2
    80001b9c:	00000097          	auipc	ra,0x0
    80001ba0:	e58080e7          	jalr	-424(ra) # 800019f4 <_ZN7ThreadKC1EPFvPvES0_Pmmbb>
    80001ba4:	0200006f          	j	80001bc4 <_ZN7ThreadK12createThreadEPFvPvES0_Pmbb+0x8c>
    80001ba8:	00050913          	mv	s2,a0
    80001bac:	00048513          	mv	a0,s1
    80001bb0:	00000097          	auipc	ra,0x0
    80001bb4:	c64080e7          	jalr	-924(ra) # 80001814 <_ZN7ThreadKdlEPv>
    80001bb8:	00090513          	mv	a0,s2
    80001bbc:	00008097          	auipc	ra,0x8
    80001bc0:	f2c080e7          	jalr	-212(ra) # 80009ae8 <_Unwind_Resume>
}
    80001bc4:	00048513          	mv	a0,s1
    80001bc8:	03813083          	ld	ra,56(sp)
    80001bcc:	03013403          	ld	s0,48(sp)
    80001bd0:	02813483          	ld	s1,40(sp)
    80001bd4:	02013903          	ld	s2,32(sp)
    80001bd8:	01813983          	ld	s3,24(sp)
    80001bdc:	01013a03          	ld	s4,16(sp)
    80001be0:	00813a83          	ld	s5,8(sp)
    80001be4:	00013b03          	ld	s6,0(sp)
    80001be8:	04010113          	addi	sp,sp,64
    80001bec:	00008067          	ret

0000000080001bf0 <_ZN7ThreadKD1Ev>:

ThreadK::~ThreadK() {
    80001bf0:	fe010113          	addi	sp,sp,-32
    80001bf4:	00113c23          	sd	ra,24(sp)
    80001bf8:	00813823          	sd	s0,16(sp)
    80001bfc:	00913423          	sd	s1,8(sp)
    80001c00:	02010413          	addi	s0,sp,32
    80001c04:	00050493          	mv	s1,a0
    if(body){
    80001c08:	00053783          	ld	a5,0(a0)
    80001c0c:	00078a63          	beqz	a5,80001c20 <_ZN7ThreadKD1Ev+0x30>
        delete begUser;
    80001c10:	05853503          	ld	a0,88(a0)
    80001c14:	00050663          	beqz	a0,80001c20 <_ZN7ThreadKD1Ev+0x30>
    80001c18:	00001097          	auipc	ra,0x1
    80001c1c:	c70080e7          	jalr	-912(ra) # 80002888 <_ZdlPv>
    }
    delete begKernel;
    80001c20:	0504b503          	ld	a0,80(s1)
    80001c24:	00050663          	beqz	a0,80001c30 <_ZN7ThreadKD1Ev+0x40>
    80001c28:	00001097          	auipc	ra,0x1
    80001c2c:	c60080e7          	jalr	-928(ra) # 80002888 <_ZdlPv>
    delete thread_sem;
    80001c30:	0784b503          	ld	a0,120(s1)
    80001c34:	00050863          	beqz	a0,80001c44 <_ZN7ThreadKD1Ev+0x54>
    80001c38:	00053783          	ld	a5,0(a0)
    80001c3c:	0087b783          	ld	a5,8(a5)
    80001c40:	000780e7          	jalr	a5
}
    80001c44:	01813083          	ld	ra,24(sp)
    80001c48:	01013403          	ld	s0,16(sp)
    80001c4c:	00813483          	ld	s1,8(sp)
    80001c50:	02010113          	addi	sp,sp,32
    80001c54:	00008067          	ret

0000000080001c58 <_ZN7ThreadK13deleteThreadsEv>:

void ThreadK::deleteThreads() {
    80001c58:	fe010113          	addi	sp,sp,-32
    80001c5c:	00113c23          	sd	ra,24(sp)
    80001c60:	00813823          	sd	s0,16(sp)
    80001c64:	00913423          	sd	s1,8(sp)
    80001c68:	02010413          	addi	s0,sp,32
    while (finishedHead) {
    80001c6c:	00007497          	auipc	s1,0x7
    80001c70:	d7c4b483          	ld	s1,-644(s1) # 800089e8 <_ZN7ThreadK12finishedHeadE>
    80001c74:	02048a63          	beqz	s1,80001ca8 <_ZN7ThreadK13deleteThreadsEv+0x50>
        ThreadK *tmp = finishedHead;
        ThreadK::finishedHead = finishedHead->nextThread;
    80001c78:	0204b783          	ld	a5,32(s1)
    80001c7c:	00007717          	auipc	a4,0x7
    80001c80:	d6f73623          	sd	a5,-660(a4) # 800089e8 <_ZN7ThreadK12finishedHeadE>
        tmp->nextThread = nullptr;
    80001c84:	0204b023          	sd	zero,32(s1)
        delete tmp;
    80001c88:	fe0482e3          	beqz	s1,80001c6c <_ZN7ThreadK13deleteThreadsEv+0x14>
    80001c8c:	00048513          	mv	a0,s1
    80001c90:	00000097          	auipc	ra,0x0
    80001c94:	f60080e7          	jalr	-160(ra) # 80001bf0 <_ZN7ThreadKD1Ev>
    80001c98:	00048513          	mv	a0,s1
    80001c9c:	00000097          	auipc	ra,0x0
    80001ca0:	b78080e7          	jalr	-1160(ra) # 80001814 <_ZN7ThreadKdlEPv>
    80001ca4:	fc9ff06f          	j	80001c6c <_ZN7ThreadK13deleteThreadsEv+0x14>
    }
}
    80001ca8:	01813083          	ld	ra,24(sp)
    80001cac:	01013403          	ld	s0,16(sp)
    80001cb0:	00813483          	ld	s1,8(sp)
    80001cb4:	02010113          	addi	sp,sp,32
    80001cb8:	00008067          	ret

0000000080001cbc <_ZN7ThreadK4killEv>:

void ThreadK::kill() {
    80001cbc:	fe010113          	addi	sp,sp,-32
    80001cc0:	00113c23          	sd	ra,24(sp)
    80001cc4:	00813823          	sd	s0,16(sp)
    80001cc8:	00913423          	sd	s1,8(sp)
    80001ccc:	02010413          	addi	s0,sp,32
    80001cd0:	00050493          	mv	s1,a0
    }

    void setFinished(bool finished) {
        ThreadK::finished = finished;
    80001cd4:	00100793          	li	a5,1
    80001cd8:	00f50c23          	sb	a5,24(a0)
    this->setFinished(true);
    if(this->thread_sem->getValue() < 0)
    80001cdc:	07853503          	ld	a0,120(a0)
    virtual ~SemaphoreK();
    int getValue() const{
        return value;
    80001ce0:	00852783          	lw	a5,8(a0)
    80001ce4:	0207cc63          	bltz	a5,80001d1c <_ZN7ThreadK4killEv+0x60>
        this->thread_sem->signal();
    if(ThreadK::finishedHead){
    80001ce8:	00007797          	auipc	a5,0x7
    80001cec:	d007b783          	ld	a5,-768(a5) # 800089e8 <_ZN7ThreadK12finishedHeadE>
    80001cf0:	02078e63          	beqz	a5,80001d2c <_ZN7ThreadK4killEv+0x70>
        ThreadK::finishedTail = ThreadK::finishedTail->nextThread = this;
    80001cf4:	00007797          	auipc	a5,0x7
    80001cf8:	cdc78793          	addi	a5,a5,-804 # 800089d0 <_ZN7ThreadK7runningE>
    80001cfc:	0207b703          	ld	a4,32(a5)
    80001d00:	02973023          	sd	s1,32(a4)
    80001d04:	0297b023          	sd	s1,32(a5)
    }
    else{
        ThreadK::finishedHead = ThreadK::finishedTail = this;
    }
}
    80001d08:	01813083          	ld	ra,24(sp)
    80001d0c:	01013403          	ld	s0,16(sp)
    80001d10:	00813483          	ld	s1,8(sp)
    80001d14:	02010113          	addi	sp,sp,32
    80001d18:	00008067          	ret
        this->thread_sem->signal();
    80001d1c:	00053783          	ld	a5,0(a0)
    80001d20:	0187b783          	ld	a5,24(a5)
    80001d24:	000780e7          	jalr	a5
    80001d28:	fc1ff06f          	j	80001ce8 <_ZN7ThreadK4killEv+0x2c>
        ThreadK::finishedHead = ThreadK::finishedTail = this;
    80001d2c:	00007797          	auipc	a5,0x7
    80001d30:	ca478793          	addi	a5,a5,-860 # 800089d0 <_ZN7ThreadK7runningE>
    80001d34:	0297b023          	sd	s1,32(a5)
    80001d38:	0097bc23          	sd	s1,24(a5)
}
    80001d3c:	fcdff06f          	j	80001d08 <_ZN7ThreadK4killEv+0x4c>

0000000080001d40 <_ZN9Scheduler4idleEPv>:
                                                             DEFAULT_STACK_SIZE * sizeof(uint64)), false, false);
    }
    return instance;
}

void Scheduler::idle(void *arg) {
    80001d40:	ff010113          	addi	sp,sp,-16
    80001d44:	00813423          	sd	s0,8(sp)
    80001d48:	01010413          	addi	s0,sp,16
    while (true) {}
    80001d4c:	0000006f          	j	80001d4c <_ZN9Scheduler4idleEPv+0xc>

0000000080001d50 <_ZN9Scheduler3getEv>:
ThreadK *Scheduler::get() {
    80001d50:	ff010113          	addi	sp,sp,-16
    80001d54:	00813423          	sd	s0,8(sp)
    80001d58:	01010413          	addi	s0,sp,16
    ThreadK *tmp = instance->listHead;
    80001d5c:	00007697          	auipc	a3,0x7
    80001d60:	c9c6b683          	ld	a3,-868(a3) # 800089f8 <_ZN9Scheduler8instanceE>
    80001d64:	0086b503          	ld	a0,8(a3)
    if(tmp->body == idle){
    80001d68:	00053703          	ld	a4,0(a0)
    80001d6c:	00000797          	auipc	a5,0x0
    80001d70:	fd478793          	addi	a5,a5,-44 # 80001d40 <_ZN9Scheduler4idleEPv>
    80001d74:	02f70263          	beq	a4,a5,80001d98 <_ZN9Scheduler3getEv+0x48>
    instance->listHead = instance->listHead->nextThread;
    80001d78:	0086b783          	ld	a5,8(a3)
    80001d7c:	0207b783          	ld	a5,32(a5)
    80001d80:	00f6b423          	sd	a5,8(a3)
    if (!instance->listHead) instance->listTail = nullptr;
    80001d84:	06078863          	beqz	a5,80001df4 <_ZN9Scheduler3getEv+0xa4>
    tmp->nextThread = nullptr;
    80001d88:	02053023          	sd	zero,32(a0)
}
    80001d8c:	00813403          	ld	s0,8(sp)
    80001d90:	01010113          	addi	sp,sp,16
    80001d94:	00008067          	ret
        tmp = tmp->nextThread;
    80001d98:	02053603          	ld	a2,32(a0)
    80001d9c:	00060793          	mv	a5,a2
        while(tmp){
    80001da0:	00078a63          	beqz	a5,80001db4 <_ZN9Scheduler3getEv+0x64>
            if(!tmp->systemThread){
    80001da4:	0717c703          	lbu	a4,113(a5)
    80001da8:	02070c63          	beqz	a4,80001de0 <_ZN9Scheduler3getEv+0x90>
                tmp = tmp->nextThread;
    80001dac:	0207b783          	ld	a5,32(a5)
        while(tmp){
    80001db0:	ff1ff06f          	j	80001da0 <_ZN9Scheduler3getEv+0x50>
        bool flag = false;
    80001db4:	00000793          	li	a5,0
        if(flag){
    80001db8:	02078063          	beqz	a5,80001dd8 <_ZN9Scheduler3getEv+0x88>
            instance->listHead = instance->listHead->nextThread;
    80001dbc:	00c6b423          	sd	a2,8(a3)
            tmp1->nextThread = nullptr;
    80001dc0:	02053023          	sd	zero,32(a0)
            if(!instance->listHead) instance->listHead = instance->listTail = tmp1;
    80001dc4:	0086b783          	ld	a5,8(a3)
    80001dc8:	02078063          	beqz	a5,80001de8 <_ZN9Scheduler3getEv+0x98>
            else instance->listTail = instance->listTail->nextThread = tmp1;
    80001dcc:	0106b783          	ld	a5,16(a3)
    80001dd0:	02a7b023          	sd	a0,32(a5)
    80001dd4:	00a6b823          	sd	a0,16(a3)
        tmp = instance->listHead;
    80001dd8:	0086b503          	ld	a0,8(a3)
    80001ddc:	f9dff06f          	j	80001d78 <_ZN9Scheduler3getEv+0x28>
                flag = true;
    80001de0:	00100793          	li	a5,1
    80001de4:	fd5ff06f          	j	80001db8 <_ZN9Scheduler3getEv+0x68>
            if(!instance->listHead) instance->listHead = instance->listTail = tmp1;
    80001de8:	00a6b823          	sd	a0,16(a3)
    80001dec:	00a6b423          	sd	a0,8(a3)
    80001df0:	fe9ff06f          	j	80001dd8 <_ZN9Scheduler3getEv+0x88>
    if (!instance->listHead) instance->listTail = nullptr;
    80001df4:	0006b823          	sd	zero,16(a3)
    80001df8:	f91ff06f          	j	80001d88 <_ZN9Scheduler3getEv+0x38>

0000000080001dfc <_ZN9Scheduler3putEP7ThreadK>:
void Scheduler::put(ThreadK *thread) {
    80001dfc:	ff010113          	addi	sp,sp,-16
    80001e00:	00813423          	sd	s0,8(sp)
    80001e04:	01010413          	addi	s0,sp,16
    if (instance->listTail) {
    80001e08:	00007797          	auipc	a5,0x7
    80001e0c:	bf07b783          	ld	a5,-1040(a5) # 800089f8 <_ZN9Scheduler8instanceE>
    80001e10:	0107b703          	ld	a4,16(a5)
    80001e14:	02070063          	beqz	a4,80001e34 <_ZN9Scheduler3putEP7ThreadK+0x38>
        instance->listTail->nextThread = thread;
    80001e18:	02a73023          	sd	a0,32(a4)
        instance->listTail = instance->listTail->nextThread;
    80001e1c:	0107b703          	ld	a4,16(a5)
    80001e20:	02073703          	ld	a4,32(a4)
    80001e24:	00e7b823          	sd	a4,16(a5)
}
    80001e28:	00813403          	ld	s0,8(sp)
    80001e2c:	01010113          	addi	sp,sp,16
    80001e30:	00008067          	ret
        instance->listHead = instance->listTail = thread;
    80001e34:	00a7b823          	sd	a0,16(a5)
    80001e38:	00a7b423          	sd	a0,8(a5)
}
    80001e3c:	fedff06f          	j	80001e28 <_ZN9Scheduler3putEP7ThreadK+0x2c>

0000000080001e40 <_ZN9Scheduler10initializeEv>:
    if (instance == nullptr) {
    80001e40:	00007797          	auipc	a5,0x7
    80001e44:	bb87b783          	ld	a5,-1096(a5) # 800089f8 <_ZN9Scheduler8instanceE>
    80001e48:	00078863          	beqz	a5,80001e58 <_ZN9Scheduler10initializeEv+0x18>
}
    80001e4c:	00007517          	auipc	a0,0x7
    80001e50:	bac53503          	ld	a0,-1108(a0) # 800089f8 <_ZN9Scheduler8instanceE>
    80001e54:	00008067          	ret
Scheduler *Scheduler::initialize() {
    80001e58:	fe010113          	addi	sp,sp,-32
    80001e5c:	00113c23          	sd	ra,24(sp)
    80001e60:	00813823          	sd	s0,16(sp)
    80001e64:	00913423          	sd	s1,8(sp)
    80001e68:	02010413          	addi	s0,sp,32
        instance = (Scheduler *) MemoryAllocator::kmem_alloc(sizeof(Scheduler));
    80001e6c:	01800513          	li	a0,24
    80001e70:	00002097          	auipc	ra,0x2
    80001e74:	8f0080e7          	jalr	-1808(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
    80001e78:	00007497          	auipc	s1,0x7
    80001e7c:	b8048493          	addi	s1,s1,-1152 # 800089f8 <_ZN9Scheduler8instanceE>
    80001e80:	00a4b023          	sd	a0,0(s1)
        instance->listHead = nullptr;
    80001e84:	00053423          	sd	zero,8(a0)
        instance->listTail = nullptr;
    80001e88:	00053823          	sd	zero,16(a0)
                                                     (uint64 *) MemoryAllocator::kmem_alloc(
    80001e8c:	00008537          	lui	a0,0x8
    80001e90:	00002097          	auipc	ra,0x2
    80001e94:	8d0080e7          	jalr	-1840(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
    80001e98:	00050613          	mv	a2,a0
        instance->idleThread = ThreadK::createThread((ThreadK::Body) &Scheduler::idle, nullptr,
    80001e9c:	0004b483          	ld	s1,0(s1)
    80001ea0:	00000713          	li	a4,0
    80001ea4:	00000693          	li	a3,0
    80001ea8:	00000593          	li	a1,0
    80001eac:	00000517          	auipc	a0,0x0
    80001eb0:	e9450513          	addi	a0,a0,-364 # 80001d40 <_ZN9Scheduler4idleEPv>
    80001eb4:	00000097          	auipc	ra,0x0
    80001eb8:	c84080e7          	jalr	-892(ra) # 80001b38 <_ZN7ThreadK12createThreadEPFvPvES0_Pmbb>
    80001ebc:	00a4b023          	sd	a0,0(s1)
}
    80001ec0:	00007517          	auipc	a0,0x7
    80001ec4:	b3853503          	ld	a0,-1224(a0) # 800089f8 <_ZN9Scheduler8instanceE>
    80001ec8:	01813083          	ld	ra,24(sp)
    80001ecc:	01013403          	ld	s0,16(sp)
    80001ed0:	00813483          	ld	s1,8(sp)
    80001ed4:	02010113          	addi	sp,sp,32
    80001ed8:	00008067          	ret

0000000080001edc <_ZN9Scheduler12deInitializeEv>:
}

int Scheduler::deInitialize() {
    80001edc:	fe010113          	addi	sp,sp,-32
    80001ee0:	00113c23          	sd	ra,24(sp)
    80001ee4:	00813823          	sd	s0,16(sp)
    80001ee8:	00913423          	sd	s1,8(sp)
    80001eec:	02010413          	addi	s0,sp,32
    delete instance->idleThread;
    80001ef0:	00007797          	auipc	a5,0x7
    80001ef4:	b087b783          	ld	a5,-1272(a5) # 800089f8 <_ZN9Scheduler8instanceE>
    80001ef8:	0007b483          	ld	s1,0(a5)
    80001efc:	00048e63          	beqz	s1,80001f18 <_ZN9Scheduler12deInitializeEv+0x3c>
    80001f00:	00048513          	mv	a0,s1
    80001f04:	00000097          	auipc	ra,0x0
    80001f08:	cec080e7          	jalr	-788(ra) # 80001bf0 <_ZN7ThreadKD1Ev>
    80001f0c:	00048513          	mv	a0,s1
    80001f10:	00000097          	auipc	ra,0x0
    80001f14:	904080e7          	jalr	-1788(ra) # 80001814 <_ZN7ThreadKdlEPv>
    return MemoryAllocator::kmem_free(instance);
    80001f18:	00007517          	auipc	a0,0x7
    80001f1c:	ae053503          	ld	a0,-1312(a0) # 800089f8 <_ZN9Scheduler8instanceE>
    80001f20:	00002097          	auipc	ra,0x2
    80001f24:	9a4080e7          	jalr	-1628(ra) # 800038c4 <_ZN15MemoryAllocator9kmem_freeEPv>

}
    80001f28:	01813083          	ld	ra,24(sp)
    80001f2c:	01013403          	ld	s0,16(sp)
    80001f30:	00813483          	ld	s1,8(sp)
    80001f34:	02010113          	addi	sp,sp,32
    80001f38:	00008067          	ret

0000000080001f3c <main>:
#include "../h/Riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/ThreadK.hpp"
#include "../h/ConsoleK.hpp"

void main() {
    80001f3c:	fc010113          	addi	sp,sp,-64
    80001f40:	02113c23          	sd	ra,56(sp)
    80001f44:	02813823          	sd	s0,48(sp)
    80001f48:	02913423          	sd	s1,40(sp)
    80001f4c:	04010413          	addi	s0,sp,64
    extern void userMain();
    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);
    80001f50:	00007797          	auipc	a5,0x7
    80001f54:	9d07b783          	ld	a5,-1584(a5) # 80008920 <_GLOBAL_OFFSET_TABLE_+0x28>
    __asm__ volatile("csrw stvec, %[stvec]": : [stvec] "r" (stvec));
    80001f58:	10579073          	csrw	stvec,a5
    MemoryAllocator::initialize();
    80001f5c:	00001097          	auipc	ra,0x1
    80001f60:	788080e7          	jalr	1928(ra) # 800036e4 <_ZN15MemoryAllocator10initializeEv>
    Scheduler::initialize();
    80001f64:	00000097          	auipc	ra,0x0
    80001f68:	edc080e7          	jalr	-292(ra) # 80001e40 <_ZN9Scheduler10initializeEv>
    ConsoleK::initialize();
    80001f6c:	00001097          	auipc	ra,0x1
    80001f70:	d34080e7          	jalr	-716(ra) # 80002ca0 <_ZN8ConsoleK10initializeEv>
    thread_t threads[4];
    //main create
    threads[0] = ThreadK::createThread(nullptr, nullptr, nullptr, true, false);
    80001f74:	00000713          	li	a4,0
    80001f78:	00100693          	li	a3,1
    80001f7c:	00000613          	li	a2,0
    80001f80:	00000593          	li	a1,0
    80001f84:	00000513          	li	a0,0
    80001f88:	00000097          	auipc	ra,0x0
    80001f8c:	bb0080e7          	jalr	-1104(ra) # 80001b38 <_ZN7ThreadK12createThreadEPFvPvES0_Pmbb>
    80001f90:	fca43023          	sd	a0,-64(s0)
    //userMain thread create
    threads[1] = ThreadK::createThread(reinterpret_cast<void (*)(void *)>(userMain), nullptr, (uint64*) MemoryAllocator::kmem_alloc(DEFAULT_STACK_SIZE*sizeof(uint64)), false, false);
    80001f94:	00008537          	lui	a0,0x8
    80001f98:	00001097          	auipc	ra,0x1
    80001f9c:	7c8080e7          	jalr	1992(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
    80001fa0:	00050613          	mv	a2,a0
    80001fa4:	00000713          	li	a4,0
    80001fa8:	00000693          	li	a3,0
    80001fac:	00000593          	li	a1,0
    80001fb0:	00007517          	auipc	a0,0x7
    80001fb4:	95053503          	ld	a0,-1712(a0) # 80008900 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001fb8:	00000097          	auipc	ra,0x0
    80001fbc:	b80080e7          	jalr	-1152(ra) # 80001b38 <_ZN7ThreadK12createThreadEPFvPvES0_Pmbb>
    80001fc0:	fca43423          	sd	a0,-56(s0)
    //console threads create
    threads[2] = ThreadK::createThread(ConsoleK::producer, nullptr, (uint64*) MemoryAllocator::kmem_alloc(DEFAULT_STACK_SIZE*sizeof(uint64)), true,false);
    80001fc4:	00008537          	lui	a0,0x8
    80001fc8:	00001097          	auipc	ra,0x1
    80001fcc:	798080e7          	jalr	1944(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
    80001fd0:	00050613          	mv	a2,a0
    80001fd4:	00000713          	li	a4,0
    80001fd8:	00100693          	li	a3,1
    80001fdc:	00000593          	li	a1,0
    80001fe0:	00007517          	auipc	a0,0x7
    80001fe4:	97853503          	ld	a0,-1672(a0) # 80008958 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001fe8:	00000097          	auipc	ra,0x0
    80001fec:	b50080e7          	jalr	-1200(ra) # 80001b38 <_ZN7ThreadK12createThreadEPFvPvES0_Pmbb>
    80001ff0:	fca43823          	sd	a0,-48(s0)
    threads[3] = ThreadK::createThread(ConsoleK::consumer, nullptr, (uint64*) MemoryAllocator::kmem_alloc(DEFAULT_STACK_SIZE*sizeof(uint64)), true, false);
    80001ff4:	00008537          	lui	a0,0x8
    80001ff8:	00001097          	auipc	ra,0x1
    80001ffc:	768080e7          	jalr	1896(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
    80002000:	00050613          	mv	a2,a0
    80002004:	00000713          	li	a4,0
    80002008:	00100693          	li	a3,1
    8000200c:	00000593          	li	a1,0
    80002010:	00007517          	auipc	a0,0x7
    80002014:	96853503          	ld	a0,-1688(a0) # 80008978 <_GLOBAL_OFFSET_TABLE_+0x80>
    80002018:	00000097          	auipc	ra,0x0
    8000201c:	b20080e7          	jalr	-1248(ra) # 80001b38 <_ZN7ThreadK12createThreadEPFvPvES0_Pmbb>
    80002020:	fca43c23          	sd	a0,-40(s0)
    ThreadK::running = threads[0];
    80002024:	fc043703          	ld	a4,-64(s0)
    80002028:	00007797          	auipc	a5,0x7
    8000202c:	9187b783          	ld	a5,-1768(a5) # 80008940 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002030:	00e7b023          	sd	a4,0(a5)

    threads[1]->join();
    80002034:	fc843503          	ld	a0,-56(s0)
    80002038:	00000097          	auipc	ra,0x0
    8000203c:	98c080e7          	jalr	-1652(ra) # 800019c4 <_ZN7ThreadK4joinEv>

    while (!ConsoleK::finished()) {
    80002040:	00001097          	auipc	ra,0x1
    80002044:	fb0080e7          	jalr	-80(ra) # 80002ff0 <_ZN8ConsoleK8finishedEv>
    80002048:	00051863          	bnez	a0,80002058 <main+0x11c>
        ThreadK::yield();
    8000204c:	fffff097          	auipc	ra,0xfffff
    80002050:	73c080e7          	jalr	1852(ra) # 80001788 <_ZN7ThreadK5yieldEv>
    80002054:	fedff06f          	j	80002040 <main+0x104>
    }
    //bezopasno je ovde raditi kill jer nece doci do promena konteksta pa nece zabagovati scheduler
    //NAPOMENA: ne smeju se ubijati niti koje su u scheduleru sa funkcijom kill, mogu biti uspavane ili running
    for(auto t: threads){
    80002058:	fc040493          	addi	s1,s0,-64
    8000205c:	0140006f          	j	80002070 <main+0x134>
        t->kill();
    80002060:	0004b503          	ld	a0,0(s1)
    80002064:	00000097          	auipc	ra,0x0
    80002068:	c58080e7          	jalr	-936(ra) # 80001cbc <_ZN7ThreadK4killEv>
    for(auto t: threads){
    8000206c:	00848493          	addi	s1,s1,8
    80002070:	fe040793          	addi	a5,s0,-32
    80002074:	fef496e3          	bne	s1,a5,80002060 <main+0x124>
    }

    ThreadK::deleteThreads();
    80002078:	00000097          	auipc	ra,0x0
    8000207c:	be0080e7          	jalr	-1056(ra) # 80001c58 <_ZN7ThreadK13deleteThreadsEv>

    Scheduler::deInitialize();
    80002080:	00000097          	auipc	ra,0x0
    80002084:	e5c080e7          	jalr	-420(ra) # 80001edc <_ZN9Scheduler12deInitializeEv>
    ConsoleK::deInitialize();
    80002088:	00000097          	auipc	ra,0x0
    8000208c:	030080e7          	jalr	48(ra) # 800020b8 <_ZN8ConsoleK12deInitializeEv>
public:
    static void initialize();
    static void* kmem_alloc(size_t realSz);//realSz is parameter in bytes
    static int kmem_free(void * address);
    static int deInitialize(){
        instance->free_mem_head = nullptr;
    80002090:	00007797          	auipc	a5,0x7
    80002094:	8d07b783          	ld	a5,-1840(a5) # 80008960 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002098:	0007b703          	ld	a4,0(a5)
    8000209c:	00073023          	sd	zero,0(a4)
        instance = nullptr;
    800020a0:	0007b023          	sd	zero,0(a5)
    MemoryAllocator::deInitialize();

    800020a4:	03813083          	ld	ra,56(sp)
    800020a8:	03013403          	ld	s0,48(sp)
    800020ac:	02813483          	ld	s1,40(sp)
    800020b0:	04010113          	addi	sp,sp,64
    800020b4:	00008067          	ret

00000000800020b8 <_ZN8ConsoleK12deInitializeEv>:
#include "../h/Event.hpp"

class ConsoleK {
public:
    static ConsoleK* initialize();
    static int deInitialize(){
    800020b8:	fe010113          	addi	sp,sp,-32
    800020bc:	00113c23          	sd	ra,24(sp)
    800020c0:	00813823          	sd	s0,16(sp)
    800020c4:	00913423          	sd	s1,8(sp)
    800020c8:	02010413          	addi	s0,sp,32
        delete instance->bufferIn;
    800020cc:	00007797          	auipc	a5,0x7
    800020d0:	8847b783          	ld	a5,-1916(a5) # 80008950 <_GLOBAL_OFFSET_TABLE_+0x58>
    800020d4:	0007b783          	ld	a5,0(a5)
    800020d8:	0107b483          	ld	s1,16(a5)
    800020dc:	04048e63          	beqz	s1,80002138 <_ZN8ConsoleK12deInitializeEv+0x80>

class BoundedBuffer {
public:
    BoundedBuffer();
    ~BoundedBuffer(){
        delete mutex;
    800020e0:	0084b503          	ld	a0,8(s1)
    800020e4:	00050863          	beqz	a0,800020f4 <_ZN8ConsoleK12deInitializeEv+0x3c>
    800020e8:	00053783          	ld	a5,0(a0)
    800020ec:	0087b783          	ld	a5,8(a5)
    800020f0:	000780e7          	jalr	a5
        delete spaceAvailable;
    800020f4:	0104b503          	ld	a0,16(s1)
    800020f8:	00050863          	beqz	a0,80002108 <_ZN8ConsoleK12deInitializeEv+0x50>
    800020fc:	00053783          	ld	a5,0(a0)
    80002100:	0087b783          	ld	a5,8(a5)
    80002104:	000780e7          	jalr	a5
        delete itemAvailable;
    80002108:	0184b503          	ld	a0,24(s1)
    8000210c:	00050863          	beqz	a0,8000211c <_ZN8ConsoleK12deInitializeEv+0x64>
    80002110:	00053783          	ld	a5,0(a0)
    80002114:	0087b783          	ld	a5,8(a5)
    80002118:	000780e7          	jalr	a5
        delete buffer;
    8000211c:	0204b503          	ld	a0,32(s1)
    80002120:	00050663          	beqz	a0,8000212c <_ZN8ConsoleK12deInitializeEv+0x74>
    80002124:	00000097          	auipc	ra,0x0
    80002128:	764080e7          	jalr	1892(ra) # 80002888 <_ZdlPv>
    8000212c:	00048513          	mv	a0,s1
    80002130:	00001097          	auipc	ra,0x1
    80002134:	af8080e7          	jalr	-1288(ra) # 80002c28 <_ZN13BoundedBufferdlEPv>
        delete instance->bufferOut;
    80002138:	00007797          	auipc	a5,0x7
    8000213c:	8187b783          	ld	a5,-2024(a5) # 80008950 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002140:	0007b783          	ld	a5,0(a5)
    80002144:	0187b483          	ld	s1,24(a5)
    80002148:	04048e63          	beqz	s1,800021a4 <_ZN8ConsoleK12deInitializeEv+0xec>
        delete mutex;
    8000214c:	0084b503          	ld	a0,8(s1)
    80002150:	00050863          	beqz	a0,80002160 <_ZN8ConsoleK12deInitializeEv+0xa8>
    80002154:	00053783          	ld	a5,0(a0)
    80002158:	0087b783          	ld	a5,8(a5)
    8000215c:	000780e7          	jalr	a5
        delete spaceAvailable;
    80002160:	0104b503          	ld	a0,16(s1)
    80002164:	00050863          	beqz	a0,80002174 <_ZN8ConsoleK12deInitializeEv+0xbc>
    80002168:	00053783          	ld	a5,0(a0)
    8000216c:	0087b783          	ld	a5,8(a5)
    80002170:	000780e7          	jalr	a5
        delete itemAvailable;
    80002174:	0184b503          	ld	a0,24(s1)
    80002178:	00050863          	beqz	a0,80002188 <_ZN8ConsoleK12deInitializeEv+0xd0>
    8000217c:	00053783          	ld	a5,0(a0)
    80002180:	0087b783          	ld	a5,8(a5)
    80002184:	000780e7          	jalr	a5
        delete buffer;
    80002188:	0204b503          	ld	a0,32(s1)
    8000218c:	00050663          	beqz	a0,80002198 <_ZN8ConsoleK12deInitializeEv+0xe0>
    80002190:	00000097          	auipc	ra,0x0
    80002194:	6f8080e7          	jalr	1784(ra) # 80002888 <_ZdlPv>
    80002198:	00048513          	mv	a0,s1
    8000219c:	00001097          	auipc	ra,0x1
    800021a0:	a8c080e7          	jalr	-1396(ra) # 80002c28 <_ZN13BoundedBufferdlEPv>
        delete instance->semPutC;
    800021a4:	00006797          	auipc	a5,0x6
    800021a8:	7ac7b783          	ld	a5,1964(a5) # 80008950 <_GLOBAL_OFFSET_TABLE_+0x58>
    800021ac:	0007b783          	ld	a5,0(a5)
    800021b0:	0087b503          	ld	a0,8(a5)
    800021b4:	00050863          	beqz	a0,800021c4 <_ZN8ConsoleK12deInitializeEv+0x10c>
    800021b8:	00053783          	ld	a5,0(a0)
    800021bc:	0087b783          	ld	a5,8(a5)
    800021c0:	000780e7          	jalr	a5
        delete instance->semGetC;
    800021c4:	00006797          	auipc	a5,0x6
    800021c8:	78c7b783          	ld	a5,1932(a5) # 80008950 <_GLOBAL_OFFSET_TABLE_+0x58>
    800021cc:	0007b783          	ld	a5,0(a5)
    800021d0:	0007b503          	ld	a0,0(a5)
    800021d4:	00050863          	beqz	a0,800021e4 <_ZN8ConsoleK12deInitializeEv+0x12c>
    800021d8:	00053783          	ld	a5,0(a0)
    800021dc:	0087b783          	ld	a5,8(a5)
    800021e0:	000780e7          	jalr	a5
        return MemoryAllocator::kmem_free(instance);
    800021e4:	00006797          	auipc	a5,0x6
    800021e8:	76c7b783          	ld	a5,1900(a5) # 80008950 <_GLOBAL_OFFSET_TABLE_+0x58>
    800021ec:	0007b503          	ld	a0,0(a5)
    800021f0:	00001097          	auipc	ra,0x1
    800021f4:	6d4080e7          	jalr	1748(ra) # 800038c4 <_ZN15MemoryAllocator9kmem_freeEPv>
    }
    800021f8:	01813083          	ld	ra,24(sp)
    800021fc:	01013403          	ld	s0,16(sp)
    80002200:	00813483          	ld	s1,8(sp)
    80002204:	02010113          	addi	sp,sp,32
    80002208:	00008067          	ret

000000008000220c <_ZN10SemaphoreKD1Ev>:
    tmp->prevThread = nullptr;
    tmp->goodDeblock = true;
    Scheduler::put(tmp);
}

SemaphoreK::~SemaphoreK() {
    8000220c:	fe010113          	addi	sp,sp,-32
    80002210:	00113c23          	sd	ra,24(sp)
    80002214:	00813823          	sd	s0,16(sp)
    80002218:	00913423          	sd	s1,8(sp)
    8000221c:	02010413          	addi	s0,sp,32
    80002220:	00050493          	mv	s1,a0
    80002224:	00006797          	auipc	a5,0x6
    80002228:	5f478793          	addi	a5,a5,1524 # 80008818 <_ZTV10SemaphoreK+0x10>
    8000222c:	00f53023          	sd	a5,0(a0)
    80002230:	01c0006f          	j	8000224c <_ZN10SemaphoreKD1Ev+0x40>
    while(headBlocked != nullptr){
        ThreadK* tmp = headBlocked;
        headBlocked = headBlocked->nextThread;
        if(headBlocked) headBlocked->prevThread = nullptr;
        else tailBlocked = nullptr;
    80002234:	0004bc23          	sd	zero,24(s1)
        tmp->nextThread = nullptr;
    80002238:	02053023          	sd	zero,32(a0)
        tmp->prevThread = nullptr;
    8000223c:	02053423          	sd	zero,40(a0)
        tmp->goodDeblock = false;
    80002240:	06050023          	sb	zero,96(a0)
        Scheduler::put(tmp);
    80002244:	00000097          	auipc	ra,0x0
    80002248:	bb8080e7          	jalr	-1096(ra) # 80001dfc <_ZN9Scheduler3putEP7ThreadK>
    while(headBlocked != nullptr){
    8000224c:	0104b503          	ld	a0,16(s1)
    80002250:	00050c63          	beqz	a0,80002268 <_ZN10SemaphoreKD1Ev+0x5c>
        headBlocked = headBlocked->nextThread;
    80002254:	02053783          	ld	a5,32(a0)
    80002258:	00f4b823          	sd	a5,16(s1)
        if(headBlocked) headBlocked->prevThread = nullptr;
    8000225c:	fc078ce3          	beqz	a5,80002234 <_ZN10SemaphoreKD1Ev+0x28>
    80002260:	0207b423          	sd	zero,40(a5)
    80002264:	fd5ff06f          	j	80002238 <_ZN10SemaphoreKD1Ev+0x2c>
    }
}
    80002268:	01813083          	ld	ra,24(sp)
    8000226c:	01013403          	ld	s0,16(sp)
    80002270:	00813483          	ld	s1,8(sp)
    80002274:	02010113          	addi	sp,sp,32
    80002278:	00008067          	ret

000000008000227c <_ZN10SemaphoreK5blockEv>:
void SemaphoreK::block() {
    8000227c:	fc010113          	addi	sp,sp,-64
    80002280:	02113c23          	sd	ra,56(sp)
    80002284:	02813823          	sd	s0,48(sp)
    80002288:	02913423          	sd	s1,40(sp)
    8000228c:	04010413          	addi	s0,sp,64
    ThreadK* old = ThreadK::running;
    80002290:	00006797          	auipc	a5,0x6
    80002294:	6b07b783          	ld	a5,1712(a5) # 80008940 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002298:	0007b483          	ld	s1,0(a5)
    if(tailBlocked){
    8000229c:	01853783          	ld	a5,24(a0)
    800022a0:	08078063          	beqz	a5,80002320 <_ZN10SemaphoreK5blockEv+0xa4>
        tailBlocked->nextThread = old;
    800022a4:	0297b023          	sd	s1,32(a5)
        old->prevThread = tailBlocked;
    800022a8:	01853783          	ld	a5,24(a0)
    800022ac:	02f4b423          	sd	a5,40(s1)
        tailBlocked = tailBlocked->nextThread;
    800022b0:	0207b783          	ld	a5,32(a5)
    800022b4:	00f53c23          	sd	a5,24(a0)
    old->blockedOnWait = true;
    800022b8:	00100793          	li	a5,1
    800022bc:	06f48823          	sb	a5,112(s1)
    __asm__ volatile ("csrr %[sepc], sepc" :  [sepc] "=r" (sepc));
    800022c0:	141027f3          	csrr	a5,sepc
    800022c4:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    800022c8:	fc843783          	ld	a5,-56(s0)
    uint64 volatile sepc = Riscv::r_sepc() + 4;
    800022cc:	00478793          	addi	a5,a5,4
    800022d0:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" :  [sstatus] "=r" (sstatus));
    800022d4:	100027f3          	csrr	a5,sstatus
    800022d8:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    800022dc:	fc043783          	ld	a5,-64(s0)
    uint64 volatile sstatus = Riscv::r_sstatus();
    800022e0:	fcf43823          	sd	a5,-48(s0)
    ThreadK::timeSliceCounter = 0;
    800022e4:	00006797          	auipc	a5,0x6
    800022e8:	6847b783          	ld	a5,1668(a5) # 80008968 <_GLOBAL_OFFSET_TABLE_+0x70>
    800022ec:	0007b023          	sd	zero,0(a5)
    ThreadK::dispatch();
    800022f0:	fffff097          	auipc	ra,0xfffff
    800022f4:	420080e7          	jalr	1056(ra) # 80001710 <_ZN7ThreadK8dispatchEv>
    Riscv::w_sstatus(sstatus);
    800022f8:	fd043783          	ld	a5,-48(s0)
    __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r" (sstatus));
    800022fc:	10079073          	csrw	sstatus,a5
    Riscv::w_sepc(sepc);
    80002300:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r" (sepc));
    80002304:	14179073          	csrw	sepc,a5
    old->blockedOnWait = false;
    80002308:	06048823          	sb	zero,112(s1)
}
    8000230c:	03813083          	ld	ra,56(sp)
    80002310:	03013403          	ld	s0,48(sp)
    80002314:	02813483          	ld	s1,40(sp)
    80002318:	04010113          	addi	sp,sp,64
    8000231c:	00008067          	ret
        headBlocked = tailBlocked = old;
    80002320:	00953c23          	sd	s1,24(a0)
    80002324:	00953823          	sd	s1,16(a0)
    80002328:	f91ff06f          	j	800022b8 <_ZN10SemaphoreK5blockEv+0x3c>

000000008000232c <_ZN10SemaphoreK4waitEv>:
    if(--value<0){
    8000232c:	00852783          	lw	a5,8(a0)
    80002330:	fff7879b          	addiw	a5,a5,-1
    80002334:	00f52423          	sw	a5,8(a0)
    80002338:	02079713          	slli	a4,a5,0x20
    8000233c:	02074063          	bltz	a4,8000235c <_ZN10SemaphoreK4waitEv+0x30>
    if(ThreadK::running->goodDeblock) {
    80002340:	00006797          	auipc	a5,0x6
    80002344:	6007b783          	ld	a5,1536(a5) # 80008940 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002348:	0007b783          	ld	a5,0(a5)
    8000234c:	0607c783          	lbu	a5,96(a5)
    80002350:	04078a63          	beqz	a5,800023a4 <_ZN10SemaphoreK4waitEv+0x78>
        return 0;
    80002354:	00000513          	li	a0,0
    80002358:	00008067          	ret
int SemaphoreK::wait() {
    8000235c:	ff010113          	addi	sp,sp,-16
    80002360:	00113423          	sd	ra,8(sp)
    80002364:	00813023          	sd	s0,0(sp)
    80002368:	01010413          	addi	s0,sp,16
        block();
    8000236c:	00000097          	auipc	ra,0x0
    80002370:	f10080e7          	jalr	-240(ra) # 8000227c <_ZN10SemaphoreK5blockEv>
    if(ThreadK::running->goodDeblock) {
    80002374:	00006797          	auipc	a5,0x6
    80002378:	5cc7b783          	ld	a5,1484(a5) # 80008940 <_GLOBAL_OFFSET_TABLE_+0x48>
    8000237c:	0007b783          	ld	a5,0(a5)
    80002380:	0607c783          	lbu	a5,96(a5)
    80002384:	00078c63          	beqz	a5,8000239c <_ZN10SemaphoreK4waitEv+0x70>
        return 0;
    80002388:	00000513          	li	a0,0
}
    8000238c:	00813083          	ld	ra,8(sp)
    80002390:	00013403          	ld	s0,0(sp)
    80002394:	01010113          	addi	sp,sp,16
    80002398:	00008067          	ret
        return -1;
    8000239c:	fff00513          	li	a0,-1
    800023a0:	fedff06f          	j	8000238c <_ZN10SemaphoreK4waitEv+0x60>
    800023a4:	fff00513          	li	a0,-1
}
    800023a8:	00008067          	ret

00000000800023ac <_ZN10SemaphoreK7deblockEv>:
void SemaphoreK::deblock() {
    800023ac:	ff010113          	addi	sp,sp,-16
    800023b0:	00113423          	sd	ra,8(sp)
    800023b4:	00813023          	sd	s0,0(sp)
    800023b8:	01010413          	addi	s0,sp,16
    800023bc:	00050793          	mv	a5,a0
    ThreadK* tmp = headBlocked;
    800023c0:	01053503          	ld	a0,16(a0)
    headBlocked = headBlocked->nextThread;
    800023c4:	02053703          	ld	a4,32(a0)
    800023c8:	00e7b823          	sd	a4,16(a5)
    if(headBlocked) headBlocked->prevThread = nullptr;
    800023cc:	02070863          	beqz	a4,800023fc <_ZN10SemaphoreK7deblockEv+0x50>
    800023d0:	02073423          	sd	zero,40(a4)
    tmp->nextThread = nullptr;
    800023d4:	02053023          	sd	zero,32(a0)
    tmp->prevThread = nullptr;
    800023d8:	02053423          	sd	zero,40(a0)
    tmp->goodDeblock = true;
    800023dc:	00100793          	li	a5,1
    800023e0:	06f50023          	sb	a5,96(a0)
    Scheduler::put(tmp);
    800023e4:	00000097          	auipc	ra,0x0
    800023e8:	a18080e7          	jalr	-1512(ra) # 80001dfc <_ZN9Scheduler3putEP7ThreadK>
}
    800023ec:	00813083          	ld	ra,8(sp)
    800023f0:	00013403          	ld	s0,0(sp)
    800023f4:	01010113          	addi	sp,sp,16
    800023f8:	00008067          	ret
    else tailBlocked = nullptr;
    800023fc:	0007bc23          	sd	zero,24(a5)
    80002400:	fd5ff06f          	j	800023d4 <_ZN10SemaphoreK7deblockEv+0x28>

0000000080002404 <_ZN10SemaphoreK6signalEv>:
    if(value++<0) {
    80002404:	00852783          	lw	a5,8(a0)
    80002408:	0017871b          	addiw	a4,a5,1
    8000240c:	00e52423          	sw	a4,8(a0)
    80002410:	0007c663          	bltz	a5,8000241c <_ZN10SemaphoreK6signalEv+0x18>
}
    80002414:	00000513          	li	a0,0
    80002418:	00008067          	ret
int SemaphoreK::signal() {
    8000241c:	ff010113          	addi	sp,sp,-16
    80002420:	00113423          	sd	ra,8(sp)
    80002424:	00813023          	sd	s0,0(sp)
    80002428:	01010413          	addi	s0,sp,16
        deblock();
    8000242c:	00000097          	auipc	ra,0x0
    80002430:	f80080e7          	jalr	-128(ra) # 800023ac <_ZN10SemaphoreK7deblockEv>
}
    80002434:	00000513          	li	a0,0
    80002438:	00813083          	ld	ra,8(sp)
    8000243c:	00013403          	ld	s0,0(sp)
    80002440:	01010113          	addi	sp,sp,16
    80002444:	00008067          	ret

0000000080002448 <_ZN10SemaphoreKnwEm>:

void *SemaphoreK::operator new(size_t size) {
    80002448:	ff010113          	addi	sp,sp,-16
    8000244c:	00113423          	sd	ra,8(sp)
    80002450:	00813023          	sd	s0,0(sp)
    80002454:	01010413          	addi	s0,sp,16
    return MemoryAllocator::kmem_alloc(size);
    80002458:	00001097          	auipc	ra,0x1
    8000245c:	308080e7          	jalr	776(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
}
    80002460:	00813083          	ld	ra,8(sp)
    80002464:	00013403          	ld	s0,0(sp)
    80002468:	01010113          	addi	sp,sp,16
    8000246c:	00008067          	ret

0000000080002470 <_ZN10SemaphoreKdlEPv>:

void SemaphoreK::operator delete(void *p) {
    80002470:	ff010113          	addi	sp,sp,-16
    80002474:	00113423          	sd	ra,8(sp)
    80002478:	00813023          	sd	s0,0(sp)
    8000247c:	01010413          	addi	s0,sp,16
    MemoryAllocator::kmem_free(p);
    80002480:	00001097          	auipc	ra,0x1
    80002484:	444080e7          	jalr	1092(ra) # 800038c4 <_ZN15MemoryAllocator9kmem_freeEPv>
}
    80002488:	00813083          	ld	ra,8(sp)
    8000248c:	00013403          	ld	s0,0(sp)
    80002490:	01010113          	addi	sp,sp,16
    80002494:	00008067          	ret

0000000080002498 <_ZN10SemaphoreKD0Ev>:
SemaphoreK::~SemaphoreK() {
    80002498:	fe010113          	addi	sp,sp,-32
    8000249c:	00113c23          	sd	ra,24(sp)
    800024a0:	00813823          	sd	s0,16(sp)
    800024a4:	00913423          	sd	s1,8(sp)
    800024a8:	02010413          	addi	s0,sp,32
    800024ac:	00050493          	mv	s1,a0
}
    800024b0:	00000097          	auipc	ra,0x0
    800024b4:	d5c080e7          	jalr	-676(ra) # 8000220c <_ZN10SemaphoreKD1Ev>
    800024b8:	00048513          	mv	a0,s1
    800024bc:	00000097          	auipc	ra,0x0
    800024c0:	fb4080e7          	jalr	-76(ra) # 80002470 <_ZN10SemaphoreKdlEPv>
    800024c4:	01813083          	ld	ra,24(sp)
    800024c8:	01013403          	ld	s0,16(sp)
    800024cc:	00813483          	ld	s1,8(sp)
    800024d0:	02010113          	addi	sp,sp,32
    800024d4:	00008067          	ret

00000000800024d8 <_ZN10SemaphoreKnaEm>:

void *SemaphoreK::operator new[](size_t size) {
    800024d8:	ff010113          	addi	sp,sp,-16
    800024dc:	00113423          	sd	ra,8(sp)
    800024e0:	00813023          	sd	s0,0(sp)
    800024e4:	01010413          	addi	s0,sp,16
    return MemoryAllocator::kmem_alloc(size);
    800024e8:	00001097          	auipc	ra,0x1
    800024ec:	278080e7          	jalr	632(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
}
    800024f0:	00813083          	ld	ra,8(sp)
    800024f4:	00013403          	ld	s0,0(sp)
    800024f8:	01010113          	addi	sp,sp,16
    800024fc:	00008067          	ret

0000000080002500 <_ZN10SemaphoreKdaEPv>:

void SemaphoreK::operator delete[](void *p) {
    80002500:	ff010113          	addi	sp,sp,-16
    80002504:	00113423          	sd	ra,8(sp)
    80002508:	00813023          	sd	s0,0(sp)
    8000250c:	01010413          	addi	s0,sp,16
    MemoryAllocator::kmem_free(p);
    80002510:	00001097          	auipc	ra,0x1
    80002514:	3b4080e7          	jalr	948(ra) # 800038c4 <_ZN15MemoryAllocator9kmem_freeEPv>
}
    80002518:	00813083          	ld	ra,8(sp)
    8000251c:	00013403          	ld	s0,0(sp)
    80002520:	01010113          	addi	sp,sp,16
    80002524:	00008067          	ret

0000000080002528 <_ZN6Thread13helperWrapperEPv>:

Thread::Thread() {
    thread_create_only(&myHandle, helperWrapper, this);
}

void Thread::helperWrapper(void *arg) {
    80002528:	ff010113          	addi	sp,sp,-16
    8000252c:	00113423          	sd	ra,8(sp)
    80002530:	00813023          	sd	s0,0(sp)
    80002534:	01010413          	addi	s0,sp,16
    Thread *t = (Thread *) arg;
    t->run();
    80002538:	00053783          	ld	a5,0(a0)
    8000253c:	0107b783          	ld	a5,16(a5)
    80002540:	000780e7          	jalr	a5
}
    80002544:	00813083          	ld	ra,8(sp)
    80002548:	00013403          	ld	s0,0(sp)
    8000254c:	01010113          	addi	sp,sp,16
    80002550:	00008067          	ret

0000000080002554 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002554:	fe010113          	addi	sp,sp,-32
    80002558:	00113c23          	sd	ra,24(sp)
    8000255c:	00813823          	sd	s0,16(sp)
    80002560:	00913423          	sd	s1,8(sp)
    80002564:	02010413          	addi	s0,sp,32
    80002568:	00006797          	auipc	a5,0x6
    8000256c:	31078793          	addi	a5,a5,784 # 80008878 <_ZTV6Thread+0x10>
    80002570:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    80002574:	00853483          	ld	s1,8(a0)
    80002578:	00048e63          	beqz	s1,80002594 <_ZN6ThreadD1Ev+0x40>
    8000257c:	00048513          	mv	a0,s1
    80002580:	fffff097          	auipc	ra,0xfffff
    80002584:	670080e7          	jalr	1648(ra) # 80001bf0 <_ZN7ThreadKD1Ev>
    80002588:	00048513          	mv	a0,s1
    8000258c:	fffff097          	auipc	ra,0xfffff
    80002590:	288080e7          	jalr	648(ra) # 80001814 <_ZN7ThreadKdlEPv>
}
    80002594:	01813083          	ld	ra,24(sp)
    80002598:	01013403          	ld	s0,16(sp)
    8000259c:	00813483          	ld	s1,8(sp)
    800025a0:	02010113          	addi	sp,sp,32
    800025a4:	00008067          	ret

00000000800025a8 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800025a8:	ff010113          	addi	sp,sp,-16
    800025ac:	00113423          	sd	ra,8(sp)
    800025b0:	00813023          	sd	s0,0(sp)
    800025b4:	01010413          	addi	s0,sp,16
    800025b8:	00006797          	auipc	a5,0x6
    800025bc:	2e878793          	addi	a5,a5,744 # 800088a0 <_ZTV9Semaphore+0x10>
    800025c0:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800025c4:	00853503          	ld	a0,8(a0)
    800025c8:	fffff097          	auipc	ra,0xfffff
    800025cc:	e98080e7          	jalr	-360(ra) # 80001460 <_Z9sem_closeP10SemaphoreK>
}
    800025d0:	00813083          	ld	ra,8(sp)
    800025d4:	00013403          	ld	s0,0(sp)
    800025d8:	01010113          	addi	sp,sp,16
    800025dc:	00008067          	ret

00000000800025e0 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    800025e0:	ff010113          	addi	sp,sp,-16
    800025e4:	00113423          	sd	ra,8(sp)
    800025e8:	00813023          	sd	s0,0(sp)
    800025ec:	01010413          	addi	s0,sp,16
    800025f0:	00006797          	auipc	a5,0x6
    800025f4:	28878793          	addi	a5,a5,648 # 80008878 <_ZTV6Thread+0x10>
    800025f8:	00f53023          	sd	a5,0(a0)
    thread_create_only(&myHandle, body, arg);
    800025fc:	00850513          	addi	a0,a0,8
    80002600:	fffff097          	auipc	ra,0xfffff
    80002604:	ffc080e7          	jalr	-4(ra) # 800015fc <_Z18thread_create_onlyPP7ThreadKPFvPvES2_>
}
    80002608:	00813083          	ld	ra,8(sp)
    8000260c:	00013403          	ld	s0,0(sp)
    80002610:	01010113          	addi	sp,sp,16
    80002614:	00008067          	ret

0000000080002618 <_ZN6Thread5startEv>:
int Thread::start() {
    80002618:	ff010113          	addi	sp,sp,-16
    8000261c:	00113423          	sd	ra,8(sp)
    80002620:	00813023          	sd	s0,0(sp)
    80002624:	01010413          	addi	s0,sp,16
    return thread_start(myHandle);
    80002628:	00853503          	ld	a0,8(a0)
    8000262c:	fffff097          	auipc	ra,0xfffff
    80002630:	05c080e7          	jalr	92(ra) # 80001688 <_Z12thread_startP7ThreadK>
}
    80002634:	00813083          	ld	ra,8(sp)
    80002638:	00013403          	ld	s0,0(sp)
    8000263c:	01010113          	addi	sp,sp,16
    80002640:	00008067          	ret

0000000080002644 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002644:	ff010113          	addi	sp,sp,-16
    80002648:	00113423          	sd	ra,8(sp)
    8000264c:	00813023          	sd	s0,0(sp)
    80002650:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002654:	fffff097          	auipc	ra,0xfffff
    80002658:	d5c080e7          	jalr	-676(ra) # 800013b0 <_Z15thread_dispatchv>
}
    8000265c:	00813083          	ld	ra,8(sp)
    80002660:	00013403          	ld	s0,0(sp)
    80002664:	01010113          	addi	sp,sp,16
    80002668:	00008067          	ret

000000008000266c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    8000266c:	ff010113          	addi	sp,sp,-16
    80002670:	00113423          	sd	ra,8(sp)
    80002674:	00813023          	sd	s0,0(sp)
    80002678:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    8000267c:	fffff097          	auipc	ra,0xfffff
    80002680:	ed4080e7          	jalr	-300(ra) # 80001550 <_Z10time_sleepm>
}
    80002684:	00813083          	ld	ra,8(sp)
    80002688:	00013403          	ld	s0,0(sp)
    8000268c:	01010113          	addi	sp,sp,16
    80002690:	00008067          	ret

0000000080002694 <_ZN14PeriodicThread15periodicWrapperEPv>:

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, new periodicStruct(this, period)) {

}

void PeriodicThread::periodicWrapper(void *arg) {
    80002694:	fe010113          	addi	sp,sp,-32
    80002698:	00113c23          	sd	ra,24(sp)
    8000269c:	00813823          	sd	s0,16(sp)
    800026a0:	00913423          	sd	s1,8(sp)
    800026a4:	02010413          	addi	s0,sp,32
    800026a8:	00050493          	mv	s1,a0
    periodicStruct *ps = (periodicStruct *) arg;
    while (true) {
        ps->per->periodicActivation();
    800026ac:	0004b503          	ld	a0,0(s1)
    800026b0:	00053783          	ld	a5,0(a0)
    800026b4:	0187b783          	ld	a5,24(a5)
    800026b8:	000780e7          	jalr	a5
        sleep(ps->t);
    800026bc:	0084b503          	ld	a0,8(s1)
    800026c0:	00000097          	auipc	ra,0x0
    800026c4:	fac080e7          	jalr	-84(ra) # 8000266c <_ZN6Thread5sleepEm>
    while (true) {
    800026c8:	fe5ff06f          	j	800026ac <_ZN14PeriodicThread15periodicWrapperEPv+0x18>

00000000800026cc <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800026cc:	ff010113          	addi	sp,sp,-16
    800026d0:	00113423          	sd	ra,8(sp)
    800026d4:	00813023          	sd	s0,0(sp)
    800026d8:	01010413          	addi	s0,sp,16
    800026dc:	00006797          	auipc	a5,0x6
    800026e0:	19c78793          	addi	a5,a5,412 # 80008878 <_ZTV6Thread+0x10>
    800026e4:	00f53023          	sd	a5,0(a0)
    thread_create_only(&myHandle, helperWrapper, this);
    800026e8:	00050613          	mv	a2,a0
    800026ec:	00000597          	auipc	a1,0x0
    800026f0:	e3c58593          	addi	a1,a1,-452 # 80002528 <_ZN6Thread13helperWrapperEPv>
    800026f4:	00850513          	addi	a0,a0,8
    800026f8:	fffff097          	auipc	ra,0xfffff
    800026fc:	f04080e7          	jalr	-252(ra) # 800015fc <_Z18thread_create_onlyPP7ThreadKPFvPvES2_>
}
    80002700:	00813083          	ld	ra,8(sp)
    80002704:	00013403          	ld	s0,0(sp)
    80002708:	01010113          	addi	sp,sp,16
    8000270c:	00008067          	ret

0000000080002710 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002710:	ff010113          	addi	sp,sp,-16
    80002714:	00113423          	sd	ra,8(sp)
    80002718:	00813023          	sd	s0,0(sp)
    8000271c:	01010413          	addi	s0,sp,16
    80002720:	00006797          	auipc	a5,0x6
    80002724:	18078793          	addi	a5,a5,384 # 800088a0 <_ZTV9Semaphore+0x10>
    80002728:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    8000272c:	00850513          	addi	a0,a0,8
    80002730:	fffff097          	auipc	ra,0xfffff
    80002734:	ce0080e7          	jalr	-800(ra) # 80001410 <_Z8sem_openPP10SemaphoreKj>
}
    80002738:	00813083          	ld	ra,8(sp)
    8000273c:	00013403          	ld	s0,0(sp)
    80002740:	01010113          	addi	sp,sp,16
    80002744:	00008067          	ret

0000000080002748 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002748:	ff010113          	addi	sp,sp,-16
    8000274c:	00113423          	sd	ra,8(sp)
    80002750:	00813023          	sd	s0,0(sp)
    80002754:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002758:	00853503          	ld	a0,8(a0)
    8000275c:	fffff097          	auipc	ra,0xfffff
    80002760:	d54080e7          	jalr	-684(ra) # 800014b0 <_Z8sem_waitP10SemaphoreK>
}
    80002764:	00813083          	ld	ra,8(sp)
    80002768:	00013403          	ld	s0,0(sp)
    8000276c:	01010113          	addi	sp,sp,16
    80002770:	00008067          	ret

0000000080002774 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002774:	ff010113          	addi	sp,sp,-16
    80002778:	00113423          	sd	ra,8(sp)
    8000277c:	00813023          	sd	s0,0(sp)
    80002780:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002784:	00853503          	ld	a0,8(a0)
    80002788:	fffff097          	auipc	ra,0xfffff
    8000278c:	d78080e7          	jalr	-648(ra) # 80001500 <_Z10sem_signalP10SemaphoreK>
}
    80002790:	00813083          	ld	ra,8(sp)
    80002794:	00013403          	ld	s0,0(sp)
    80002798:	01010113          	addi	sp,sp,16
    8000279c:	00008067          	ret

00000000800027a0 <_ZN7Console4getcEv>:
    }
}

char Console::getc() {
    800027a0:	ff010113          	addi	sp,sp,-16
    800027a4:	00113423          	sd	ra,8(sp)
    800027a8:	00813023          	sd	s0,0(sp)
    800027ac:	01010413          	addi	s0,sp,16
    return ::getc();
    800027b0:	fffff097          	auipc	ra,0xfffff
    800027b4:	de4080e7          	jalr	-540(ra) # 80001594 <_Z4getcv>
}
    800027b8:	00813083          	ld	ra,8(sp)
    800027bc:	00013403          	ld	s0,0(sp)
    800027c0:	01010113          	addi	sp,sp,16
    800027c4:	00008067          	ret

00000000800027c8 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800027c8:	ff010113          	addi	sp,sp,-16
    800027cc:	00113423          	sd	ra,8(sp)
    800027d0:	00813023          	sd	s0,0(sp)
    800027d4:	01010413          	addi	s0,sp,16
    ::putc(c);
    800027d8:	fffff097          	auipc	ra,0xfffff
    800027dc:	df0080e7          	jalr	-528(ra) # 800015c8 <_Z4putcc>
}
    800027e0:	00813083          	ld	ra,8(sp)
    800027e4:	00013403          	ld	s0,0(sp)
    800027e8:	01010113          	addi	sp,sp,16
    800027ec:	00008067          	ret

00000000800027f0 <_Znwm>:

void *operator new(size_t size) {
    800027f0:	ff010113          	addi	sp,sp,-16
    800027f4:	00113423          	sd	ra,8(sp)
    800027f8:	00813023          	sd	s0,0(sp)
    800027fc:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002800:	fffff097          	auipc	ra,0xfffff
    80002804:	a8c080e7          	jalr	-1396(ra) # 8000128c <_Z9mem_allocm>
}
    80002808:	00813083          	ld	ra,8(sp)
    8000280c:	00013403          	ld	s0,0(sp)
    80002810:	01010113          	addi	sp,sp,16
    80002814:	00008067          	ret

0000000080002818 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, new periodicStruct(this, period)) {
    80002818:	fe010113          	addi	sp,sp,-32
    8000281c:	00113c23          	sd	ra,24(sp)
    80002820:	00813823          	sd	s0,16(sp)
    80002824:	00913423          	sd	s1,8(sp)
    80002828:	01213023          	sd	s2,0(sp)
    8000282c:	02010413          	addi	s0,sp,32
    80002830:	00050493          	mv	s1,a0
    80002834:	00058913          	mv	s2,a1
    80002838:	01000513          	li	a0,16
    8000283c:	00000097          	auipc	ra,0x0
    80002840:	fb4080e7          	jalr	-76(ra) # 800027f0 <_Znwm>
    80002844:	00050613          	mv	a2,a0
        per = pt;
    80002848:	00953023          	sd	s1,0(a0)
        t = time;
    8000284c:	01253423          	sd	s2,8(a0)
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, new periodicStruct(this, period)) {
    80002850:	00000597          	auipc	a1,0x0
    80002854:	e4458593          	addi	a1,a1,-444 # 80002694 <_ZN14PeriodicThread15periodicWrapperEPv>
    80002858:	00048513          	mv	a0,s1
    8000285c:	00000097          	auipc	ra,0x0
    80002860:	d84080e7          	jalr	-636(ra) # 800025e0 <_ZN6ThreadC1EPFvPvES0_>
    80002864:	00006797          	auipc	a5,0x6
    80002868:	fe478793          	addi	a5,a5,-28 # 80008848 <_ZTV14PeriodicThread+0x10>
    8000286c:	00f4b023          	sd	a5,0(s1)
}
    80002870:	01813083          	ld	ra,24(sp)
    80002874:	01013403          	ld	s0,16(sp)
    80002878:	00813483          	ld	s1,8(sp)
    8000287c:	00013903          	ld	s2,0(sp)
    80002880:	02010113          	addi	sp,sp,32
    80002884:	00008067          	ret

0000000080002888 <_ZdlPv>:

void operator delete(void *p) {
    80002888:	ff010113          	addi	sp,sp,-16
    8000288c:	00113423          	sd	ra,8(sp)
    80002890:	00813023          	sd	s0,0(sp)
    80002894:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002898:	fffff097          	auipc	ra,0xfffff
    8000289c:	a30080e7          	jalr	-1488(ra) # 800012c8 <_Z8mem_freePv>
}
    800028a0:	00813083          	ld	ra,8(sp)
    800028a4:	00013403          	ld	s0,0(sp)
    800028a8:	01010113          	addi	sp,sp,16
    800028ac:	00008067          	ret

00000000800028b0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800028b0:	fe010113          	addi	sp,sp,-32
    800028b4:	00113c23          	sd	ra,24(sp)
    800028b8:	00813823          	sd	s0,16(sp)
    800028bc:	00913423          	sd	s1,8(sp)
    800028c0:	02010413          	addi	s0,sp,32
    800028c4:	00050493          	mv	s1,a0
}
    800028c8:	00000097          	auipc	ra,0x0
    800028cc:	c8c080e7          	jalr	-884(ra) # 80002554 <_ZN6ThreadD1Ev>
    800028d0:	00048513          	mv	a0,s1
    800028d4:	00000097          	auipc	ra,0x0
    800028d8:	fb4080e7          	jalr	-76(ra) # 80002888 <_ZdlPv>
    800028dc:	01813083          	ld	ra,24(sp)
    800028e0:	01013403          	ld	s0,16(sp)
    800028e4:	00813483          	ld	s1,8(sp)
    800028e8:	02010113          	addi	sp,sp,32
    800028ec:	00008067          	ret

00000000800028f0 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800028f0:	fe010113          	addi	sp,sp,-32
    800028f4:	00113c23          	sd	ra,24(sp)
    800028f8:	00813823          	sd	s0,16(sp)
    800028fc:	00913423          	sd	s1,8(sp)
    80002900:	02010413          	addi	s0,sp,32
    80002904:	00050493          	mv	s1,a0
}
    80002908:	00000097          	auipc	ra,0x0
    8000290c:	ca0080e7          	jalr	-864(ra) # 800025a8 <_ZN9SemaphoreD1Ev>
    80002910:	00048513          	mv	a0,s1
    80002914:	00000097          	auipc	ra,0x0
    80002918:	f74080e7          	jalr	-140(ra) # 80002888 <_ZdlPv>
    8000291c:	01813083          	ld	ra,24(sp)
    80002920:	01013403          	ld	s0,16(sp)
    80002924:	00813483          	ld	s1,8(sp)
    80002928:	02010113          	addi	sp,sp,32
    8000292c:	00008067          	ret

0000000080002930 <_ZN6Thread3runEv>:
    int start ();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
    80002930:	ff010113          	addi	sp,sp,-16
    80002934:	00813423          	sd	s0,8(sp)
    80002938:	01010413          	addi	s0,sp,16
    8000293c:	00813403          	ld	s0,8(sp)
    80002940:	01010113          	addi	sp,sp,16
    80002944:	00008067          	ret

0000000080002948 <_ZN14PeriodicThread18periodicActivationEv>:
    sem_t myHandle;
};
class PeriodicThread : public Thread {
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    80002948:	ff010113          	addi	sp,sp,-16
    8000294c:	00813423          	sd	s0,8(sp)
    80002950:	01010413          	addi	s0,sp,16
    80002954:	00813403          	ld	s0,8(sp)
    80002958:	01010113          	addi	sp,sp,16
    8000295c:	00008067          	ret

0000000080002960 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002960:	ff010113          	addi	sp,sp,-16
    80002964:	00113423          	sd	ra,8(sp)
    80002968:	00813023          	sd	s0,0(sp)
    8000296c:	01010413          	addi	s0,sp,16
    80002970:	00006797          	auipc	a5,0x6
    80002974:	ed878793          	addi	a5,a5,-296 # 80008848 <_ZTV14PeriodicThread+0x10>
    80002978:	00f53023          	sd	a5,0(a0)
    8000297c:	00000097          	auipc	ra,0x0
    80002980:	bd8080e7          	jalr	-1064(ra) # 80002554 <_ZN6ThreadD1Ev>
    80002984:	00813083          	ld	ra,8(sp)
    80002988:	00013403          	ld	s0,0(sp)
    8000298c:	01010113          	addi	sp,sp,16
    80002990:	00008067          	ret

0000000080002994 <_ZN14PeriodicThreadD0Ev>:
    80002994:	fe010113          	addi	sp,sp,-32
    80002998:	00113c23          	sd	ra,24(sp)
    8000299c:	00813823          	sd	s0,16(sp)
    800029a0:	00913423          	sd	s1,8(sp)
    800029a4:	02010413          	addi	s0,sp,32
    800029a8:	00050493          	mv	s1,a0
    800029ac:	00006797          	auipc	a5,0x6
    800029b0:	e9c78793          	addi	a5,a5,-356 # 80008848 <_ZTV14PeriodicThread+0x10>
    800029b4:	00f53023          	sd	a5,0(a0)
    800029b8:	00000097          	auipc	ra,0x0
    800029bc:	b9c080e7          	jalr	-1124(ra) # 80002554 <_ZN6ThreadD1Ev>
    800029c0:	00048513          	mv	a0,s1
    800029c4:	00000097          	auipc	ra,0x0
    800029c8:	ec4080e7          	jalr	-316(ra) # 80002888 <_ZdlPv>
    800029cc:	01813083          	ld	ra,24(sp)
    800029d0:	01013403          	ld	s0,16(sp)
    800029d4:	00813483          	ld	s1,8(sp)
    800029d8:	02010113          	addi	sp,sp,32
    800029dc:	00008067          	ret

00000000800029e0 <_ZN13BoundedBufferC1Ev>:
// Created by os on 6/1/22.
//

#include "../h/BoundedBuffer.hpp"

BoundedBuffer::BoundedBuffer() {
    800029e0:	fe010113          	addi	sp,sp,-32
    800029e4:	00113c23          	sd	ra,24(sp)
    800029e8:	00813823          	sd	s0,16(sp)
    800029ec:	00913423          	sd	s1,8(sp)
    800029f0:	01213023          	sd	s2,0(sp)
    800029f4:	02010413          	addi	s0,sp,32
    800029f8:	00050493          	mv	s1,a0
    mutex = new SemaphoreK(1);
    800029fc:	02000513          	li	a0,32
    80002a00:	00000097          	auipc	ra,0x0
    80002a04:	a48080e7          	jalr	-1464(ra) # 80002448 <_ZN10SemaphoreKnwEm>

#include "../h/ThreadK.hpp"

class SemaphoreK {
public:
    SemaphoreK(int val = 1): value(val){}
    80002a08:	00006917          	auipc	s2,0x6
    80002a0c:	f2893903          	ld	s2,-216(s2) # 80008930 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002a10:	01090913          	addi	s2,s2,16
    80002a14:	01253023          	sd	s2,0(a0)
    80002a18:	00100793          	li	a5,1
    80002a1c:	00f52423          	sw	a5,8(a0)
    80002a20:	00053823          	sd	zero,16(a0)
    80002a24:	00053c23          	sd	zero,24(a0)
    80002a28:	00a4b423          	sd	a0,8(s1)
    spaceAvailable = new SemaphoreK(N);
    80002a2c:	02000513          	li	a0,32
    80002a30:	00000097          	auipc	ra,0x0
    80002a34:	a18080e7          	jalr	-1512(ra) # 80002448 <_ZN10SemaphoreKnwEm>
    80002a38:	01253023          	sd	s2,0(a0)
    80002a3c:	40000793          	li	a5,1024
    80002a40:	00f52423          	sw	a5,8(a0)
    80002a44:	00053823          	sd	zero,16(a0)
    80002a48:	00053c23          	sd	zero,24(a0)
    80002a4c:	00a4b823          	sd	a0,16(s1)
    itemAvailable = new SemaphoreK(0);
    80002a50:	02000513          	li	a0,32
    80002a54:	00000097          	auipc	ra,0x0
    80002a58:	9f4080e7          	jalr	-1548(ra) # 80002448 <_ZN10SemaphoreKnwEm>
    80002a5c:	01253023          	sd	s2,0(a0)
    80002a60:	00052423          	sw	zero,8(a0)
    80002a64:	00053823          	sd	zero,16(a0)
    80002a68:	00053c23          	sd	zero,24(a0)
    80002a6c:	00a4bc23          	sd	a0,24(s1)
    head = tail =  0;
    80002a70:	0204a623          	sw	zero,44(s1)
    80002a74:	0204a423          	sw	zero,40(s1)
    occ =0;
    80002a78:	0004b023          	sd	zero,0(s1)
    buffer = (char*) MemoryAllocator::kmem_alloc(N * sizeof(char));
    80002a7c:	40000513          	li	a0,1024
    80002a80:	00001097          	auipc	ra,0x1
    80002a84:	ce0080e7          	jalr	-800(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
    80002a88:	02a4b023          	sd	a0,32(s1)
}
    80002a8c:	01813083          	ld	ra,24(sp)
    80002a90:	01013403          	ld	s0,16(sp)
    80002a94:	00813483          	ld	s1,8(sp)
    80002a98:	00013903          	ld	s2,0(sp)
    80002a9c:	02010113          	addi	sp,sp,32
    80002aa0:	00008067          	ret

0000000080002aa4 <_ZN13BoundedBuffer6appendEc>:

void BoundedBuffer::append(char c) {
    80002aa4:	fe010113          	addi	sp,sp,-32
    80002aa8:	00113c23          	sd	ra,24(sp)
    80002aac:	00813823          	sd	s0,16(sp)
    80002ab0:	00913423          	sd	s1,8(sp)
    80002ab4:	01213023          	sd	s2,0(sp)
    80002ab8:	02010413          	addi	s0,sp,32
    80002abc:	00050493          	mv	s1,a0
    80002ac0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80002ac4:	01053503          	ld	a0,16(a0)
    80002ac8:	00053783          	ld	a5,0(a0)
    80002acc:	0107b783          	ld	a5,16(a5)
    80002ad0:	000780e7          	jalr	a5
    mutex->wait();
    80002ad4:	0084b503          	ld	a0,8(s1)
    80002ad8:	00053783          	ld	a5,0(a0)
    80002adc:	0107b783          	ld	a5,16(a5)
    80002ae0:	000780e7          	jalr	a5
    if(occ < N) {
    80002ae4:	0004b703          	ld	a4,0(s1)
    80002ae8:	3ff00793          	li	a5,1023
    80002aec:	02e7e863          	bltu	a5,a4,80002b1c <_ZN13BoundedBuffer6appendEc+0x78>
        buffer[tail] = c;
    80002af0:	0204b783          	ld	a5,32(s1)
    80002af4:	02c4a703          	lw	a4,44(s1)
    80002af8:	00e787b3          	add	a5,a5,a4
    80002afc:	01278023          	sb	s2,0(a5)
        tail = (tail + 1) % N;
    80002b00:	02c4a783          	lw	a5,44(s1)
    80002b04:	0017879b          	addiw	a5,a5,1
    80002b08:	3ff7f793          	andi	a5,a5,1023
    80002b0c:	02f4a623          	sw	a5,44(s1)
        occ++;
    80002b10:	0004b783          	ld	a5,0(s1)
    80002b14:	00178793          	addi	a5,a5,1
    80002b18:	00f4b023          	sd	a5,0(s1)
    }
    mutex->signal();
    80002b1c:	0084b503          	ld	a0,8(s1)
    80002b20:	00053783          	ld	a5,0(a0)
    80002b24:	0187b783          	ld	a5,24(a5)
    80002b28:	000780e7          	jalr	a5
    if(occ < N) {
    80002b2c:	0004b703          	ld	a4,0(s1)
    80002b30:	3ff00793          	li	a5,1023
    80002b34:	00e7ea63          	bltu	a5,a4,80002b48 <_ZN13BoundedBuffer6appendEc+0xa4>
        itemAvailable->signal();
    80002b38:	0184b503          	ld	a0,24(s1)
    80002b3c:	00053783          	ld	a5,0(a0)
    80002b40:	0187b783          	ld	a5,24(a5)
    80002b44:	000780e7          	jalr	a5
    }
}
    80002b48:	01813083          	ld	ra,24(sp)
    80002b4c:	01013403          	ld	s0,16(sp)
    80002b50:	00813483          	ld	s1,8(sp)
    80002b54:	00013903          	ld	s2,0(sp)
    80002b58:	02010113          	addi	sp,sp,32
    80002b5c:	00008067          	ret

0000000080002b60 <_ZN13BoundedBuffer4takeEv>:

char BoundedBuffer::take() {
    80002b60:	fe010113          	addi	sp,sp,-32
    80002b64:	00113c23          	sd	ra,24(sp)
    80002b68:	00813823          	sd	s0,16(sp)
    80002b6c:	00913423          	sd	s1,8(sp)
    80002b70:	01213023          	sd	s2,0(sp)
    80002b74:	02010413          	addi	s0,sp,32
    80002b78:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80002b7c:	01853503          	ld	a0,24(a0)
    80002b80:	00053783          	ld	a5,0(a0)
    80002b84:	0107b783          	ld	a5,16(a5)
    80002b88:	000780e7          	jalr	a5
    mutex->wait();
    80002b8c:	0084b503          	ld	a0,8(s1)
    80002b90:	00053783          	ld	a5,0(a0)
    80002b94:	0107b783          	ld	a5,16(a5)
    80002b98:	000780e7          	jalr	a5
    char c = buffer[head];
    80002b9c:	0204b703          	ld	a4,32(s1)
    80002ba0:	0284a783          	lw	a5,40(s1)
    80002ba4:	00f70733          	add	a4,a4,a5
    80002ba8:	00074903          	lbu	s2,0(a4)
    head = (head+1)%N;
    80002bac:	0017879b          	addiw	a5,a5,1
    80002bb0:	3ff7f793          	andi	a5,a5,1023
    80002bb4:	02f4a423          	sw	a5,40(s1)
    occ--;
    80002bb8:	0004b783          	ld	a5,0(s1)
    80002bbc:	fff78793          	addi	a5,a5,-1
    80002bc0:	00f4b023          	sd	a5,0(s1)
    mutex->signal();
    80002bc4:	0084b503          	ld	a0,8(s1)
    80002bc8:	00053783          	ld	a5,0(a0)
    80002bcc:	0187b783          	ld	a5,24(a5)
    80002bd0:	000780e7          	jalr	a5
    spaceAvailable->signal();
    80002bd4:	0104b503          	ld	a0,16(s1)
    80002bd8:	00053783          	ld	a5,0(a0)
    80002bdc:	0187b783          	ld	a5,24(a5)
    80002be0:	000780e7          	jalr	a5
    return c;
}
    80002be4:	00090513          	mv	a0,s2
    80002be8:	01813083          	ld	ra,24(sp)
    80002bec:	01013403          	ld	s0,16(sp)
    80002bf0:	00813483          	ld	s1,8(sp)
    80002bf4:	00013903          	ld	s2,0(sp)
    80002bf8:	02010113          	addi	sp,sp,32
    80002bfc:	00008067          	ret

0000000080002c00 <_ZN13BoundedBuffernwEm>:
void *BoundedBuffer::operator new(size_t size) {
    80002c00:	ff010113          	addi	sp,sp,-16
    80002c04:	00113423          	sd	ra,8(sp)
    80002c08:	00813023          	sd	s0,0(sp)
    80002c0c:	01010413          	addi	s0,sp,16
    return MemoryAllocator::kmem_alloc(size);
    80002c10:	00001097          	auipc	ra,0x1
    80002c14:	b50080e7          	jalr	-1200(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
}
    80002c18:	00813083          	ld	ra,8(sp)
    80002c1c:	00013403          	ld	s0,0(sp)
    80002c20:	01010113          	addi	sp,sp,16
    80002c24:	00008067          	ret

0000000080002c28 <_ZN13BoundedBufferdlEPv>:


void BoundedBuffer::operator delete(void *p) {
    80002c28:	ff010113          	addi	sp,sp,-16
    80002c2c:	00113423          	sd	ra,8(sp)
    80002c30:	00813023          	sd	s0,0(sp)
    80002c34:	01010413          	addi	s0,sp,16
    MemoryAllocator::kmem_free(p);
    80002c38:	00001097          	auipc	ra,0x1
    80002c3c:	c8c080e7          	jalr	-884(ra) # 800038c4 <_ZN15MemoryAllocator9kmem_freeEPv>
}
    80002c40:	00813083          	ld	ra,8(sp)
    80002c44:	00013403          	ld	s0,0(sp)
    80002c48:	01010113          	addi	sp,sp,16
    80002c4c:	00008067          	ret

0000000080002c50 <_ZN13BoundedBuffernaEm>:

void *BoundedBuffer::operator new[](size_t size) {
    80002c50:	ff010113          	addi	sp,sp,-16
    80002c54:	00113423          	sd	ra,8(sp)
    80002c58:	00813023          	sd	s0,0(sp)
    80002c5c:	01010413          	addi	s0,sp,16
    return MemoryAllocator::kmem_alloc(size);
    80002c60:	00001097          	auipc	ra,0x1
    80002c64:	b00080e7          	jalr	-1280(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
}
    80002c68:	00813083          	ld	ra,8(sp)
    80002c6c:	00013403          	ld	s0,0(sp)
    80002c70:	01010113          	addi	sp,sp,16
    80002c74:	00008067          	ret

0000000080002c78 <_ZN13BoundedBufferdaEPv>:


void BoundedBuffer::operator delete[](void *p) {
    80002c78:	ff010113          	addi	sp,sp,-16
    80002c7c:	00113423          	sd	ra,8(sp)
    80002c80:	00813023          	sd	s0,0(sp)
    80002c84:	01010413          	addi	s0,sp,16
    MemoryAllocator::kmem_free(p);
    80002c88:	00001097          	auipc	ra,0x1
    80002c8c:	c3c080e7          	jalr	-964(ra) # 800038c4 <_ZN15MemoryAllocator9kmem_freeEPv>
    80002c90:	00813083          	ld	ra,8(sp)
    80002c94:	00013403          	ld	s0,0(sp)
    80002c98:	01010113          	addi	sp,sp,16
    80002c9c:	00008067          	ret

0000000080002ca0 <_ZN8ConsoleK10initializeEv>:
#include "../lib/hw.h"

ConsoleK *ConsoleK::instance = nullptr;

ConsoleK *ConsoleK::initialize() {
    if (instance == nullptr) {
    80002ca0:	00006797          	auipc	a5,0x6
    80002ca4:	d607b783          	ld	a5,-672(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002ca8:	00078863          	beqz	a5,80002cb8 <_ZN8ConsoleK10initializeEv+0x18>
        instance->bufferIn = new BoundedBuffer();
        instance->bufferOut = new BoundedBuffer();
        instance->semGetC = new Event();
        instance->semPutC = new Event();
    }
    return instance;
    80002cac:	00006517          	auipc	a0,0x6
    80002cb0:	d5453503          	ld	a0,-684(a0) # 80008a00 <_ZN8ConsoleK8instanceE>
}
    80002cb4:	00008067          	ret
ConsoleK *ConsoleK::initialize() {
    80002cb8:	fe010113          	addi	sp,sp,-32
    80002cbc:	00113c23          	sd	ra,24(sp)
    80002cc0:	00813823          	sd	s0,16(sp)
    80002cc4:	00913423          	sd	s1,8(sp)
    80002cc8:	01213023          	sd	s2,0(sp)
    80002ccc:	02010413          	addi	s0,sp,32
        instance = (ConsoleK *) MemoryAllocator::kmem_alloc(sizeof(ConsoleK));
    80002cd0:	02000513          	li	a0,32
    80002cd4:	00001097          	auipc	ra,0x1
    80002cd8:	a8c080e7          	jalr	-1396(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
    80002cdc:	00006797          	auipc	a5,0x6
    80002ce0:	d2a7b223          	sd	a0,-732(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
        instance->bufferIn = new BoundedBuffer();
    80002ce4:	03000513          	li	a0,48
    80002ce8:	00000097          	auipc	ra,0x0
    80002cec:	f18080e7          	jalr	-232(ra) # 80002c00 <_ZN13BoundedBuffernwEm>
    80002cf0:	00050493          	mv	s1,a0
    80002cf4:	00000097          	auipc	ra,0x0
    80002cf8:	cec080e7          	jalr	-788(ra) # 800029e0 <_ZN13BoundedBufferC1Ev>
    80002cfc:	00006797          	auipc	a5,0x6
    80002d00:	d047b783          	ld	a5,-764(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002d04:	0097b823          	sd	s1,16(a5)
        instance->bufferOut = new BoundedBuffer();
    80002d08:	03000513          	li	a0,48
    80002d0c:	00000097          	auipc	ra,0x0
    80002d10:	ef4080e7          	jalr	-268(ra) # 80002c00 <_ZN13BoundedBuffernwEm>
    80002d14:	00050493          	mv	s1,a0
    80002d18:	00000097          	auipc	ra,0x0
    80002d1c:	cc8080e7          	jalr	-824(ra) # 800029e0 <_ZN13BoundedBufferC1Ev>
    80002d20:	00006797          	auipc	a5,0x6
    80002d24:	ce07b783          	ld	a5,-800(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002d28:	0097bc23          	sd	s1,24(a5)
        instance->semGetC = new Event();
    80002d2c:	02000513          	li	a0,32
    80002d30:	fffff097          	auipc	ra,0xfffff
    80002d34:	718080e7          	jalr	1816(ra) # 80002448 <_ZN10SemaphoreKnwEm>
    80002d38:	00050493          	mv	s1,a0
    80002d3c:	00000097          	auipc	ra,0x0
    80002d40:	378080e7          	jalr	888(ra) # 800030b4 <_ZN5EventC1Ev>
    80002d44:	00006797          	auipc	a5,0x6
    80002d48:	cbc7b783          	ld	a5,-836(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002d4c:	0097b023          	sd	s1,0(a5)
        instance->semPutC = new Event();
    80002d50:	02000513          	li	a0,32
    80002d54:	fffff097          	auipc	ra,0xfffff
    80002d58:	6f4080e7          	jalr	1780(ra) # 80002448 <_ZN10SemaphoreKnwEm>
    80002d5c:	00050493          	mv	s1,a0
    80002d60:	00000097          	auipc	ra,0x0
    80002d64:	354080e7          	jalr	852(ra) # 800030b4 <_ZN5EventC1Ev>
    80002d68:	00006797          	auipc	a5,0x6
    80002d6c:	c987b783          	ld	a5,-872(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002d70:	0097b423          	sd	s1,8(a5)
    return instance;
    80002d74:	00006517          	auipc	a0,0x6
    80002d78:	c8c53503          	ld	a0,-884(a0) # 80008a00 <_ZN8ConsoleK8instanceE>
}
    80002d7c:	01813083          	ld	ra,24(sp)
    80002d80:	01013403          	ld	s0,16(sp)
    80002d84:	00813483          	ld	s1,8(sp)
    80002d88:	00013903          	ld	s2,0(sp)
    80002d8c:	02010113          	addi	sp,sp,32
    80002d90:	00008067          	ret
    80002d94:	00050913          	mv	s2,a0
        instance->bufferIn = new BoundedBuffer();
    80002d98:	00048513          	mv	a0,s1
    80002d9c:	00000097          	auipc	ra,0x0
    80002da0:	e8c080e7          	jalr	-372(ra) # 80002c28 <_ZN13BoundedBufferdlEPv>
    80002da4:	00090513          	mv	a0,s2
    80002da8:	00007097          	auipc	ra,0x7
    80002dac:	d40080e7          	jalr	-704(ra) # 80009ae8 <_Unwind_Resume>
    80002db0:	00050913          	mv	s2,a0
        instance->bufferOut = new BoundedBuffer();
    80002db4:	00048513          	mv	a0,s1
    80002db8:	00000097          	auipc	ra,0x0
    80002dbc:	e70080e7          	jalr	-400(ra) # 80002c28 <_ZN13BoundedBufferdlEPv>
    80002dc0:	00090513          	mv	a0,s2
    80002dc4:	00007097          	auipc	ra,0x7
    80002dc8:	d24080e7          	jalr	-732(ra) # 80009ae8 <_Unwind_Resume>
    80002dcc:	00050913          	mv	s2,a0
        instance->semGetC = new Event();
    80002dd0:	00048513          	mv	a0,s1
    80002dd4:	fffff097          	auipc	ra,0xfffff
    80002dd8:	69c080e7          	jalr	1692(ra) # 80002470 <_ZN10SemaphoreKdlEPv>
    80002ddc:	00090513          	mv	a0,s2
    80002de0:	00007097          	auipc	ra,0x7
    80002de4:	d08080e7          	jalr	-760(ra) # 80009ae8 <_Unwind_Resume>
    80002de8:	00050913          	mv	s2,a0
        instance->semPutC = new Event();
    80002dec:	00048513          	mv	a0,s1
    80002df0:	fffff097          	auipc	ra,0xfffff
    80002df4:	680080e7          	jalr	1664(ra) # 80002470 <_ZN10SemaphoreKdlEPv>
    80002df8:	00090513          	mv	a0,s2
    80002dfc:	00007097          	auipc	ra,0x7
    80002e00:	cec080e7          	jalr	-788(ra) # 80009ae8 <_Unwind_Resume>

0000000080002e04 <_ZN8ConsoleK5kputcEc>:

void ConsoleK::kputc(char c) {
    80002e04:	ff010113          	addi	sp,sp,-16
    80002e08:	00113423          	sd	ra,8(sp)
    80002e0c:	00813023          	sd	s0,0(sp)
    80002e10:	01010413          	addi	s0,sp,16
    80002e14:	00050593          	mv	a1,a0
    //putc stavlja dati znak u izlazni bafer
    instance->bufferOut->append(c);
    80002e18:	00006797          	auipc	a5,0x6
    80002e1c:	be87b783          	ld	a5,-1048(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002e20:	0187b503          	ld	a0,24(a5)
    80002e24:	00000097          	auipc	ra,0x0
    80002e28:	c80080e7          	jalr	-896(ra) # 80002aa4 <_ZN13BoundedBuffer6appendEc>
}
    80002e2c:	00813083          	ld	ra,8(sp)
    80002e30:	00013403          	ld	s0,0(sp)
    80002e34:	01010113          	addi	sp,sp,16
    80002e38:	00008067          	ret

0000000080002e3c <_ZN8ConsoleK5kgetcEv>:

char ConsoleK::kgetc() {
    80002e3c:	ff010113          	addi	sp,sp,-16
    80002e40:	00113423          	sd	ra,8(sp)
    80002e44:	00813023          	sd	s0,0(sp)
    80002e48:	01010413          	addi	s0,sp,16
    char c = instance->bufferIn->take();
    80002e4c:	00006797          	auipc	a5,0x6
    80002e50:	bb47b783          	ld	a5,-1100(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002e54:	0107b503          	ld	a0,16(a5)
    80002e58:	00000097          	auipc	ra,0x0
    80002e5c:	d08080e7          	jalr	-760(ra) # 80002b60 <_ZN13BoundedBuffer4takeEv>
    return c;
}
    80002e60:	00813083          	ld	ra,8(sp)
    80002e64:	00013403          	ld	s0,0(sp)
    80002e68:	01010113          	addi	sp,sp,16
    80002e6c:	00008067          	ret

0000000080002e70 <_ZN8ConsoleK8consumerEPv>:

void ConsoleK::consumer(void *arg) {
    80002e70:	ff010113          	addi	sp,sp,-16
    80002e74:	00113423          	sd	ra,8(sp)
    80002e78:	00813023          	sd	s0,0(sp)
    80002e7c:	01010413          	addi	s0,sp,16
    //it takes from bb and transfer to controler
    while (true) {
        instance->semPutC->wait();
    80002e80:	00006797          	auipc	a5,0x6
    80002e84:	b807b783          	ld	a5,-1152(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002e88:	0087b503          	ld	a0,8(a5)
    80002e8c:	00053783          	ld	a5,0(a0)
    80002e90:	0107b783          	ld	a5,16(a5)
    80002e94:	000780e7          	jalr	a5
        while (*((volatile char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) {
    80002e98:	00006797          	auipc	a5,0x6
    80002e9c:	a787b783          	ld	a5,-1416(a5) # 80008910 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002ea0:	0007b783          	ld	a5,0(a5)
    80002ea4:	0007c783          	lbu	a5,0(a5)
    80002ea8:	0ff7f793          	andi	a5,a5,255
    80002eac:	0207f793          	andi	a5,a5,32
    80002eb0:	fc0788e3          	beqz	a5,80002e80 <_ZN8ConsoleK8consumerEPv+0x10>
            char c = instance->bufferOut->take();
    80002eb4:	00006797          	auipc	a5,0x6
    80002eb8:	b4c7b783          	ld	a5,-1204(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002ebc:	0187b503          	ld	a0,24(a5)
    80002ec0:	00000097          	auipc	ra,0x0
    80002ec4:	ca0080e7          	jalr	-864(ra) # 80002b60 <_ZN13BoundedBuffer4takeEv>
            *((volatile char *) CONSOLE_TX_DATA) = c;
    80002ec8:	00006797          	auipc	a5,0x6
    80002ecc:	a607b783          	ld	a5,-1440(a5) # 80008928 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002ed0:	0007b783          	ld	a5,0(a5)
    80002ed4:	00a78023          	sb	a0,0(a5)
        while (*((volatile char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) {
    80002ed8:	fc1ff06f          	j	80002e98 <_ZN8ConsoleK8consumerEPv+0x28>

0000000080002edc <_ZN8ConsoleK8producerEPv>:
        }
    }
}

void ConsoleK::producer(void *arg) {
    80002edc:	ff010113          	addi	sp,sp,-16
    80002ee0:	00113423          	sd	ra,8(sp)
    80002ee4:	00813023          	sd	s0,0(sp)
    80002ee8:	01010413          	addi	s0,sp,16
    //it takes from controler and transfer to bb
    while (true) {
        instance->semGetC->wait();
    80002eec:	00006797          	auipc	a5,0x6
    80002ef0:	b147b783          	ld	a5,-1260(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002ef4:	0007b503          	ld	a0,0(a5)
    80002ef8:	00053783          	ld	a5,0(a0)
    80002efc:	0107b783          	ld	a5,16(a5)
    80002f00:	000780e7          	jalr	a5
        while (*((volatile char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT) {
    80002f04:	00006797          	auipc	a5,0x6
    80002f08:	a0c7b783          	ld	a5,-1524(a5) # 80008910 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002f0c:	0007b783          	ld	a5,0(a5)
    80002f10:	0007c783          	lbu	a5,0(a5)
    80002f14:	0017f793          	andi	a5,a5,1
    80002f18:	fc078ae3          	beqz	a5,80002eec <_ZN8ConsoleK8producerEPv+0x10>
            char c = *((volatile char *) (CONSOLE_RX_DATA));
    80002f1c:	00006797          	auipc	a5,0x6
    80002f20:	9ec7b783          	ld	a5,-1556(a5) # 80008908 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002f24:	0007b783          	ld	a5,0(a5)
    80002f28:	0007c583          	lbu	a1,0(a5)
            instance->bufferIn->append(c);
    80002f2c:	0ff5f593          	andi	a1,a1,255
    80002f30:	00006797          	auipc	a5,0x6
    80002f34:	ad07b783          	ld	a5,-1328(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002f38:	0107b503          	ld	a0,16(a5)
    80002f3c:	00000097          	auipc	ra,0x0
    80002f40:	b68080e7          	jalr	-1176(ra) # 80002aa4 <_ZN13BoundedBuffer6appendEc>
        while (*((volatile char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT) {
    80002f44:	fc1ff06f          	j	80002f04 <_ZN8ConsoleK8producerEPv+0x28>

0000000080002f48 <_ZN8ConsoleK17k_console_handlerEv>:
        }
    }
}

void ConsoleK::k_console_handler() {
    80002f48:	fe010113          	addi	sp,sp,-32
    80002f4c:	00113c23          	sd	ra,24(sp)
    80002f50:	00813823          	sd	s0,16(sp)
    80002f54:	00913423          	sd	s1,8(sp)
    80002f58:	02010413          	addi	s0,sp,32
    int num = plic_claim();
    80002f5c:	00002097          	auipc	ra,0x2
    80002f60:	c68080e7          	jalr	-920(ra) # 80004bc4 <plic_claim>
    if (num == 0x0a) {
    80002f64:	00a00793          	li	a5,10
    80002f68:	02f50063          	beq	a0,a5,80002f88 <_ZN8ConsoleK17k_console_handlerEv+0x40>
            instance->semPutC->signal();
        }
        plic_complete(CONSOLE_IRQ);
        return;
    }
    plic_complete(num);
    80002f6c:	00002097          	auipc	ra,0x2
    80002f70:	c90080e7          	jalr	-880(ra) # 80004bfc <plic_complete>
}
    80002f74:	01813083          	ld	ra,24(sp)
    80002f78:	01013403          	ld	s0,16(sp)
    80002f7c:	00813483          	ld	s1,8(sp)
    80002f80:	02010113          	addi	sp,sp,32
    80002f84:	00008067          	ret
        if (*((volatile char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT) {
    80002f88:	00006797          	auipc	a5,0x6
    80002f8c:	9887b783          	ld	a5,-1656(a5) # 80008910 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002f90:	0007b483          	ld	s1,0(a5)
    80002f94:	0004c783          	lbu	a5,0(s1)
    80002f98:	0017f793          	andi	a5,a5,1
    80002f9c:	00078e63          	beqz	a5,80002fb8 <_ZN8ConsoleK17k_console_handlerEv+0x70>
            instance->semGetC->signal();
    80002fa0:	00006797          	auipc	a5,0x6
    80002fa4:	a607b783          	ld	a5,-1440(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002fa8:	0007b503          	ld	a0,0(a5)
    80002fac:	00053783          	ld	a5,0(a0)
    80002fb0:	0187b783          	ld	a5,24(a5)
    80002fb4:	000780e7          	jalr	a5
        if (*((volatile char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) {
    80002fb8:	0004c783          	lbu	a5,0(s1)
    80002fbc:	0ff7f793          	andi	a5,a5,255
    80002fc0:	0207f793          	andi	a5,a5,32
    80002fc4:	00078e63          	beqz	a5,80002fe0 <_ZN8ConsoleK17k_console_handlerEv+0x98>
            instance->semPutC->signal();
    80002fc8:	00006797          	auipc	a5,0x6
    80002fcc:	a387b783          	ld	a5,-1480(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80002fd0:	0087b503          	ld	a0,8(a5)
    80002fd4:	00053783          	ld	a5,0(a0)
    80002fd8:	0187b783          	ld	a5,24(a5)
    80002fdc:	000780e7          	jalr	a5
        plic_complete(CONSOLE_IRQ);
    80002fe0:	00a00513          	li	a0,10
    80002fe4:	00002097          	auipc	ra,0x2
    80002fe8:	c18080e7          	jalr	-1000(ra) # 80004bfc <plic_complete>
        return;
    80002fec:	f89ff06f          	j	80002f74 <_ZN8ConsoleK17k_console_handlerEv+0x2c>

0000000080002ff0 <_ZN8ConsoleK8finishedEv>:

bool ConsoleK::finished() {
    80002ff0:	ff010113          	addi	sp,sp,-16
    80002ff4:	00813423          	sd	s0,8(sp)
    80002ff8:	01010413          	addi	s0,sp,16
    return instance->bufferOut->occ == 0;
    80002ffc:	00006797          	auipc	a5,0x6
    80003000:	a047b783          	ld	a5,-1532(a5) # 80008a00 <_ZN8ConsoleK8instanceE>
    80003004:	0187b783          	ld	a5,24(a5)
    80003008:	0007b503          	ld	a0,0(a5)
}
    8000300c:	00153513          	seqz	a0,a0
    80003010:	00813403          	ld	s0,8(sp)
    80003014:	01010113          	addi	sp,sp,16
    80003018:	00008067          	ret

000000008000301c <_ZN5Event4waitEv>:
Event::Event() {
    SemaphoreK(0);
}

int Event::wait() {
    if(--value < 0){
    8000301c:	00852783          	lw	a5,8(a0)
    80003020:	fff7879b          	addiw	a5,a5,-1
    80003024:	00f52423          	sw	a5,8(a0)
    80003028:	02079713          	slli	a4,a5,0x20
    8000302c:	00074663          	bltz	a4,80003038 <_ZN5Event4waitEv+0x1c>
        block();
    }
    return 0;
}
    80003030:	00000513          	li	a0,0
    80003034:	00008067          	ret
int Event::wait() {
    80003038:	ff010113          	addi	sp,sp,-16
    8000303c:	00113423          	sd	ra,8(sp)
    80003040:	00813023          	sd	s0,0(sp)
    80003044:	01010413          	addi	s0,sp,16
        block();
    80003048:	fffff097          	auipc	ra,0xfffff
    8000304c:	234080e7          	jalr	564(ra) # 8000227c <_ZN10SemaphoreK5blockEv>
}
    80003050:	00000513          	li	a0,0
    80003054:	00813083          	ld	ra,8(sp)
    80003058:	00013403          	ld	s0,0(sp)
    8000305c:	01010113          	addi	sp,sp,16
    80003060:	00008067          	ret

0000000080003064 <_ZN5Event6signalEv>:

int Event::signal() {
    if(++value<=0){
    80003064:	00852783          	lw	a5,8(a0)
    80003068:	0017879b          	addiw	a5,a5,1
    8000306c:	0007871b          	sext.w	a4,a5
    80003070:	00f52423          	sw	a5,8(a0)
    80003074:	00e05a63          	blez	a4,80003088 <_ZN5Event6signalEv+0x24>
        deblock();
    }else{
        value = 1;
    80003078:	00100793          	li	a5,1
    8000307c:	00f52423          	sw	a5,8(a0)
    }
    return 0;
}
    80003080:	00000513          	li	a0,0
    80003084:	00008067          	ret
int Event::signal() {
    80003088:	ff010113          	addi	sp,sp,-16
    8000308c:	00113423          	sd	ra,8(sp)
    80003090:	00813023          	sd	s0,0(sp)
    80003094:	01010413          	addi	s0,sp,16
        deblock();
    80003098:	fffff097          	auipc	ra,0xfffff
    8000309c:	314080e7          	jalr	788(ra) # 800023ac <_ZN10SemaphoreK7deblockEv>
}
    800030a0:	00000513          	li	a0,0
    800030a4:	00813083          	ld	ra,8(sp)
    800030a8:	00013403          	ld	s0,0(sp)
    800030ac:	01010113          	addi	sp,sp,16
    800030b0:	00008067          	ret

00000000800030b4 <_ZN5EventC1Ev>:
Event::Event() {
    800030b4:	fd010113          	addi	sp,sp,-48
    800030b8:	02113423          	sd	ra,40(sp)
    800030bc:	02813023          	sd	s0,32(sp)
    800030c0:	03010413          	addi	s0,sp,48
    800030c4:	00100793          	li	a5,1
    800030c8:	00f52423          	sw	a5,8(a0)
    800030cc:	00053823          	sd	zero,16(a0)
    800030d0:	00053c23          	sd	zero,24(a0)
    800030d4:	00005797          	auipc	a5,0x5
    800030d8:	7ec78793          	addi	a5,a5,2028 # 800088c0 <_ZTV5Event+0x10>
    800030dc:	00f53023          	sd	a5,0(a0)
    800030e0:	00006797          	auipc	a5,0x6
    800030e4:	8507b783          	ld	a5,-1968(a5) # 80008930 <_GLOBAL_OFFSET_TABLE_+0x38>
    800030e8:	01078793          	addi	a5,a5,16
    800030ec:	fcf43823          	sd	a5,-48(s0)
    800030f0:	fc042c23          	sw	zero,-40(s0)
    800030f4:	fe043023          	sd	zero,-32(s0)
    800030f8:	fe043423          	sd	zero,-24(s0)
    SemaphoreK(0);
    800030fc:	fd040513          	addi	a0,s0,-48
    80003100:	fffff097          	auipc	ra,0xfffff
    80003104:	10c080e7          	jalr	268(ra) # 8000220c <_ZN10SemaphoreKD1Ev>
}
    80003108:	02813083          	ld	ra,40(sp)
    8000310c:	02013403          	ld	s0,32(sp)
    80003110:	03010113          	addi	sp,sp,48
    80003114:	00008067          	ret

0000000080003118 <_ZN5EventD1Ev>:

#ifndef PROJECT_FINAL_EVENT_HPP
#define PROJECT_FINAL_EVENT_HPP
#include "../h/SemaphoreK.hpp"

class Event: public SemaphoreK {
    80003118:	ff010113          	addi	sp,sp,-16
    8000311c:	00113423          	sd	ra,8(sp)
    80003120:	00813023          	sd	s0,0(sp)
    80003124:	01010413          	addi	s0,sp,16
    80003128:	00005797          	auipc	a5,0x5
    8000312c:	79878793          	addi	a5,a5,1944 # 800088c0 <_ZTV5Event+0x10>
    80003130:	00f53023          	sd	a5,0(a0)
    80003134:	fffff097          	auipc	ra,0xfffff
    80003138:	0d8080e7          	jalr	216(ra) # 8000220c <_ZN10SemaphoreKD1Ev>
    8000313c:	00813083          	ld	ra,8(sp)
    80003140:	00013403          	ld	s0,0(sp)
    80003144:	01010113          	addi	sp,sp,16
    80003148:	00008067          	ret

000000008000314c <_ZN5EventD0Ev>:
    8000314c:	fe010113          	addi	sp,sp,-32
    80003150:	00113c23          	sd	ra,24(sp)
    80003154:	00813823          	sd	s0,16(sp)
    80003158:	00913423          	sd	s1,8(sp)
    8000315c:	02010413          	addi	s0,sp,32
    80003160:	00050493          	mv	s1,a0
    80003164:	00005797          	auipc	a5,0x5
    80003168:	75c78793          	addi	a5,a5,1884 # 800088c0 <_ZTV5Event+0x10>
    8000316c:	00f53023          	sd	a5,0(a0)
    80003170:	fffff097          	auipc	ra,0xfffff
    80003174:	09c080e7          	jalr	156(ra) # 8000220c <_ZN10SemaphoreKD1Ev>
    80003178:	00048513          	mv	a0,s1
    8000317c:	fffff097          	auipc	ra,0xfffff
    80003180:	2f4080e7          	jalr	756(ra) # 80002470 <_ZN10SemaphoreKdlEPv>
    80003184:	01813083          	ld	ra,24(sp)
    80003188:	01013403          	ld	s0,16(sp)
    8000318c:	00813483          	ld	s1,8(sp)
    80003190:	02010113          	addi	sp,sp,32
    80003194:	00008067          	ret

0000000080003198 <_ZN5Riscv10handleTrapEiPv>:
#include "../h/Riscv.hpp"
//#include "../h/MemoryAllocator.hpp"
//#include "../h/ThreadK.hpp"
#include "../h/ConsoleK.hpp"

void Riscv::handleTrap(int code, void *args) {
    80003198:	f0010113          	addi	sp,sp,-256
    8000319c:	0e113c23          	sd	ra,248(sp)
    800031a0:	0e813823          	sd	s0,240(sp)
    800031a4:	0e913423          	sd	s1,232(sp)
    800031a8:	0f213023          	sd	s2,224(sp)
    800031ac:	0d313c23          	sd	s3,216(sp)
    800031b0:	0d413823          	sd	s4,208(sp)
    800031b4:	0d513423          	sd	s5,200(sp)
    800031b8:	10010413          	addi	s0,sp,256
    800031bc:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[scause], scause" :  [scause] "=r" (scause));
    800031c0:	142027f3          	csrr	a5,scause
    800031c4:	f4f43c23          	sd	a5,-168(s0)
    return scause;
    800031c8:	f5843783          	ld	a5,-168(s0)
    uint64 *realargs = (uint64 *) args;
    void *retval = nullptr;
    uint64 volatile scause = Riscv::r_scause();
    800031cc:	faf43c23          	sd	a5,-72(s0)
    if (scause == 0x09 || scause == 0x08) {
    800031d0:	fb843703          	ld	a4,-72(s0)
    800031d4:	00900793          	li	a5,9
    800031d8:	08f70663          	beq	a4,a5,80003264 <_ZN5Riscv10handleTrapEiPv+0xcc>
    800031dc:	fb843703          	ld	a4,-72(s0)
    800031e0:	00800793          	li	a5,8
    800031e4:	08f70063          	beq	a4,a5,80003264 <_ZN5Riscv10handleTrapEiPv+0xcc>
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }
        }

    } else if (scause == 0x8000000000000001UL) {
    800031e8:	fb843703          	ld	a4,-72(s0)
    800031ec:	fff00793          	li	a5,-1
    800031f0:	03f79793          	slli	a5,a5,0x3f
    800031f4:	00178793          	addi	a5,a5,1
    800031f8:	3af70a63          	beq	a4,a5,800035ac <_ZN5Riscv10handleTrapEiPv+0x414>
            ThreadK::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
        }
        mc_sip(SIP_SEIP);
    } else if (scause == 0x8000000000000009UL) {
    800031fc:	fb843703          	ld	a4,-72(s0)
    80003200:	fff00793          	li	a5,-1
    80003204:	03f79793          	slli	a5,a5,0x3f
    80003208:	00978793          	addi	a5,a5,9
    8000320c:	44f70663          	beq	a4,a5,80003658 <_ZN5Riscv10handleTrapEiPv+0x4c0>
        ConsoleK::k_console_handler();
    } else {
        printString("unexpected exception\n");
    80003210:	00004517          	auipc	a0,0x4
    80003214:	e1050513          	addi	a0,a0,-496 # 80007020 <CONSOLE_STATUS+0x10>
    80003218:	00000097          	auipc	ra,0x0
    8000321c:	77c080e7          	jalr	1916(ra) # 80003994 <_Z11printStringPKc>
        printInt(scause);
    80003220:	fb843503          	ld	a0,-72(s0)
    80003224:	00000613          	li	a2,0
    80003228:	00a00593          	li	a1,10
    8000322c:	0005051b          	sext.w	a0,a0
    80003230:	00001097          	auipc	ra,0x1
    80003234:	8fc080e7          	jalr	-1796(ra) # 80003b2c <_Z8printIntiii>
    __asm__ volatile("csrc sip, %[mask]" : : [mask] "r" (mask));
    80003238:	00200793          	li	a5,2
    8000323c:	1447b073          	csrc	sip,a5
    }
    //potvrda obrade prekida
    mc_sip(SIP_SSIP);
}
    80003240:	0f813083          	ld	ra,248(sp)
    80003244:	0f013403          	ld	s0,240(sp)
    80003248:	0e813483          	ld	s1,232(sp)
    8000324c:	0e013903          	ld	s2,224(sp)
    80003250:	0d813983          	ld	s3,216(sp)
    80003254:	0d013a03          	ld	s4,208(sp)
    80003258:	0c813a83          	ld	s5,200(sp)
    8000325c:	10010113          	addi	sp,sp,256
    80003260:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" :  [sepc] "=r" (sepc));
    80003264:	141027f3          	csrr	a5,sepc
    80003268:	f6f43023          	sd	a5,-160(s0)
    return sepc;
    8000326c:	f6043783          	ld	a5,-160(s0)
        uint64 volatile sepc = Riscv::r_sepc();
    80003270:	f0f43023          	sd	a5,-256(s0)
        Riscv::w_sepc(sepc + 4);
    80003274:	f0043783          	ld	a5,-256(s0)
    80003278:	00478793          	addi	a5,a5,4
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r" (sepc));
    8000327c:	14179073          	csrw	sepc,a5
        switch (code) {
    80003280:	04200793          	li	a5,66
    80003284:	fa97eae3          	bltu	a5,s1,80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
    80003288:	00249713          	slli	a4,s1,0x2
    8000328c:	00004697          	auipc	a3,0x4
    80003290:	dac68693          	addi	a3,a3,-596 # 80007038 <CONSOLE_STATUS+0x28>
    80003294:	00d70733          	add	a4,a4,a3
    80003298:	00072783          	lw	a5,0(a4)
    8000329c:	00d787b3          	add	a5,a5,a3
    800032a0:	00078067          	jr	a5
                ThreadK::running->kill();
    800032a4:	00005797          	auipc	a5,0x5
    800032a8:	69c7b783          	ld	a5,1692(a5) # 80008940 <_GLOBAL_OFFSET_TABLE_+0x48>
    800032ac:	0007b503          	ld	a0,0(a5)
    800032b0:	fffff097          	auipc	ra,0xfffff
    800032b4:	a0c080e7          	jalr	-1524(ra) # 80001cbc <_ZN7ThreadK4killEv>
    __asm__ volatile ("csrr %[sepc], sepc" :  [sepc] "=r" (sepc));
    800032b8:	141027f3          	csrr	a5,sepc
    800032bc:	f6f43823          	sd	a5,-144(s0)
    return sepc;
    800032c0:	f7043783          	ld	a5,-144(s0)
                uint64 volatile sepc = r_sepc() + 4;
    800032c4:	00478793          	addi	a5,a5,4
    800032c8:	f0f43423          	sd	a5,-248(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" :  [sstatus] "=r" (sstatus));
    800032cc:	100027f3          	csrr	a5,sstatus
    800032d0:	f6f43423          	sd	a5,-152(s0)
    return sstatus;
    800032d4:	f6843783          	ld	a5,-152(s0)
                uint64 volatile sstatus = r_sstatus();
    800032d8:	f0f43823          	sd	a5,-240(s0)
                ThreadK::timeSliceCounter = 0;
    800032dc:	00005797          	auipc	a5,0x5
    800032e0:	68c7b783          	ld	a5,1676(a5) # 80008968 <_GLOBAL_OFFSET_TABLE_+0x70>
    800032e4:	0007b023          	sd	zero,0(a5)
                ThreadK::dispatch();
    800032e8:	ffffe097          	auipc	ra,0xffffe
    800032ec:	428080e7          	jalr	1064(ra) # 80001710 <_ZN7ThreadK8dispatchEv>
                w_sstatus(sstatus);
    800032f0:	f1043783          	ld	a5,-240(s0)
    __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r" (sstatus));
    800032f4:	10079073          	csrw	sstatus,a5
                w_sepc(sepc);
    800032f8:	f0843783          	ld	a5,-248(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r" (sepc));
    800032fc:	14179073          	csrw	sepc,a5
}
    80003300:	f39ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                size_t realValue = (size_t) (realargs[0]) * MEM_BLOCK_SIZE; // u bajtovima
    80003304:	0005b503          	ld	a0,0(a1)
                retval = MemoryAllocator::kmem_alloc(realValue);
    80003308:	00651513          	slli	a0,a0,0x6
    8000330c:	00000097          	auipc	ra,0x0
    80003310:	454080e7          	jalr	1108(ra) # 80003760 <_ZN15MemoryAllocator10kmem_allocEm>
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    80003314:	04a43823          	sd	a0,80(s0)
                break;
    80003318:	f21ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                retval = (void *) (uint64) MemoryAllocator::kmem_free((void *) realargs[0]);
    8000331c:	0005b503          	ld	a0,0(a1)
    80003320:	00000097          	auipc	ra,0x0
    80003324:	5a4080e7          	jalr	1444(ra) # 800038c4 <_ZN15MemoryAllocator9kmem_freeEPv>
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    80003328:	04a43823          	sd	a0,80(s0)
                break;
    8000332c:	f0dff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                ThreadK **handle = (ThreadK **) realargs[0];
    80003330:	0005b903          	ld	s2,0(a1)
                ThreadK::Body start_routine = (ThreadK::Body) realargs[1];
    80003334:	0085b983          	ld	s3,8(a1)
                void *arg = (void *) realargs[2];
    80003338:	0105ba03          	ld	s4,16(a1)
                uint64 *stack = (uint64 *) realargs[3];
    8000333c:	0185ba83          	ld	s5,24(a1)
                if(code == 0x11)
    80003340:	01100793          	li	a5,17
    80003344:	02f48063          	beq	s1,a5,80003364 <_ZN5Riscv10handleTrapEiPv+0x1cc>
                if(code == 0x14)
    80003348:	01400793          	li	a5,20
    8000334c:	02f48e63          	beq	s1,a5,80003388 <_ZN5Riscv10handleTrapEiPv+0x1f0>
                retval = (*handle ? (void *) (uint64) 0 : (void *) (uint64) -1);
    80003350:	00093783          	ld	a5,0(s2)
    80003354:	04078c63          	beqz	a5,800033ac <_ZN5Riscv10handleTrapEiPv+0x214>
    80003358:	00000793          	li	a5,0
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    8000335c:	04f43823          	sd	a5,80(s0)
                break;
    80003360:	ed9ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                    *handle = ThreadK::createThread(start_routine, arg, stack, false, false);
    80003364:	00000713          	li	a4,0
    80003368:	00000693          	li	a3,0
    8000336c:	000a8613          	mv	a2,s5
    80003370:	000a0593          	mv	a1,s4
    80003374:	00098513          	mv	a0,s3
    80003378:	ffffe097          	auipc	ra,0xffffe
    8000337c:	7c0080e7          	jalr	1984(ra) # 80001b38 <_ZN7ThreadK12createThreadEPFvPvES0_Pmbb>
    80003380:	00a93023          	sd	a0,0(s2)
    80003384:	fc5ff06f          	j	80003348 <_ZN5Riscv10handleTrapEiPv+0x1b0>
                    *handle = ThreadK::createThread(start_routine, arg, stack, false, true);
    80003388:	00100713          	li	a4,1
    8000338c:	00000693          	li	a3,0
    80003390:	000a8613          	mv	a2,s5
    80003394:	000a0593          	mv	a1,s4
    80003398:	00098513          	mv	a0,s3
    8000339c:	ffffe097          	auipc	ra,0xffffe
    800033a0:	79c080e7          	jalr	1948(ra) # 80001b38 <_ZN7ThreadK12createThreadEPFvPvES0_Pmbb>
    800033a4:	00a93023          	sd	a0,0(s2)
    800033a8:	fa9ff06f          	j	80003350 <_ZN5Riscv10handleTrapEiPv+0x1b8>
                retval = (*handle ? (void *) (uint64) 0 : (void *) (uint64) -1);
    800033ac:	fff00793          	li	a5,-1
    800033b0:	fadff06f          	j	8000335c <_ZN5Riscv10handleTrapEiPv+0x1c4>
                ThreadK *handle = (ThreadK *) realargs[0];
    800033b4:	0005b503          	ld	a0,0(a1)
                if(!handle) {
    800033b8:	00051863          	bnez	a0,800033c8 <_ZN5Riscv10handleTrapEiPv+0x230>
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    800033bc:	fff00793          	li	a5,-1
    800033c0:	04f43823          	sd	a5,80(s0)
                    break;
    800033c4:	e75ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                Scheduler::put(handle);
    800033c8:	fffff097          	auipc	ra,0xfffff
    800033cc:	a34080e7          	jalr	-1484(ra) # 80001dfc <_ZN9Scheduler3putEP7ThreadK>
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    800033d0:	00000793          	li	a5,0
    800033d4:	04f43823          	sd	a5,80(s0)
                break;
    800033d8:	e61ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                SemaphoreK** handle = (SemaphoreK**) realargs[0];
    800033dc:	0005b483          	ld	s1,0(a1)
                int init = realargs[1];
    800033e0:	0085a903          	lw	s2,8(a1)
                *handle = new SemaphoreK(init);
    800033e4:	02000513          	li	a0,32
    800033e8:	fffff097          	auipc	ra,0xfffff
    800033ec:	060080e7          	jalr	96(ra) # 80002448 <_ZN10SemaphoreKnwEm>

#include "../h/ThreadK.hpp"

class SemaphoreK {
public:
    SemaphoreK(int val = 1): value(val){}
    800033f0:	00005797          	auipc	a5,0x5
    800033f4:	5407b783          	ld	a5,1344(a5) # 80008930 <_GLOBAL_OFFSET_TABLE_+0x38>
    800033f8:	01078793          	addi	a5,a5,16
    800033fc:	00f53023          	sd	a5,0(a0)
    80003400:	01252423          	sw	s2,8(a0)
    80003404:	00053823          	sd	zero,16(a0)
    80003408:	00053c23          	sd	zero,24(a0)
    8000340c:	00a4b023          	sd	a0,0(s1)
                retval = (*handle ? (void *) (uint64) 0 : (void *) (uint64) -1);
    80003410:	00050863          	beqz	a0,80003420 <_ZN5Riscv10handleTrapEiPv+0x288>
    80003414:	00000793          	li	a5,0
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    80003418:	04f43823          	sd	a5,80(s0)
                break;
    8000341c:	e1dff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                retval = (*handle ? (void *) (uint64) 0 : (void *) (uint64) -1);
    80003420:	fff00793          	li	a5,-1
    80003424:	ff5ff06f          	j	80003418 <_ZN5Riscv10handleTrapEiPv+0x280>
                SemaphoreK* handle = (SemaphoreK*) realargs[0];
    80003428:	0005b503          	ld	a0,0(a1)
                if(!handle) {
    8000342c:	00051863          	bnez	a0,8000343c <_ZN5Riscv10handleTrapEiPv+0x2a4>
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    80003430:	fff00793          	li	a5,-1
    80003434:	04f43823          	sd	a5,80(s0)
                    break;
    80003438:	e01ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                handle->~SemaphoreK();
    8000343c:	00053783          	ld	a5,0(a0)
    80003440:	0007b783          	ld	a5,0(a5)
    80003444:	000780e7          	jalr	a5
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    80003448:	00000793          	li	a5,0
    8000344c:	04f43823          	sd	a5,80(s0)
                break;
    80003450:	de9ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                SemaphoreK* handle = (SemaphoreK*) realargs[0];
    80003454:	0005b503          	ld	a0,0(a1)
                if(!handle) {
    80003458:	00051863          	bnez	a0,80003468 <_ZN5Riscv10handleTrapEiPv+0x2d0>
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    8000345c:	fff00793          	li	a5,-1
    80003460:	04f43823          	sd	a5,80(s0)
                    break;
    80003464:	dd5ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                handle->wait();
    80003468:	00053783          	ld	a5,0(a0)
    8000346c:	0107b783          	ld	a5,16(a5)
    80003470:	000780e7          	jalr	a5
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    80003474:	00000793          	li	a5,0
    80003478:	04f43823          	sd	a5,80(s0)
                break;
    8000347c:	dbdff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                SemaphoreK* handle = (SemaphoreK*) realargs[0];
    80003480:	0005b503          	ld	a0,0(a1)
                if(!handle) {
    80003484:	00051863          	bnez	a0,80003494 <_ZN5Riscv10handleTrapEiPv+0x2fc>
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    80003488:	fff00793          	li	a5,-1
    8000348c:	04f43823          	sd	a5,80(s0)
                    break;
    80003490:	da9ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                handle->signal();
    80003494:	00053783          	ld	a5,0(a0)
    80003498:	0187b783          	ld	a5,24(a5)
    8000349c:	000780e7          	jalr	a5
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    800034a0:	00000793          	li	a5,0
    800034a4:	04f43823          	sd	a5,80(s0)
                break;
    800034a8:	d91ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                uint64 time = realargs[0];
    800034ac:	0005b503          	ld	a0,0(a1)
                if(time == 0){
    800034b0:	00051863          	bnez	a0,800034c0 <_ZN5Riscv10handleTrapEiPv+0x328>
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    800034b4:	00000793          	li	a5,0
    800034b8:	04f43823          	sd	a5,80(s0)
                    break;
    800034bc:	d7dff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                    ThreadK::putToSleep(time);
    800034c0:	ffffe097          	auipc	ra,0xffffe
    800034c4:	3cc080e7          	jalr	972(ra) # 8000188c <_ZN7ThreadK10putToSleepEm>
    __asm__ volatile ("csrr %[sepc], sepc" :  [sepc] "=r" (sepc));
    800034c8:	141027f3          	csrr	a5,sepc
    800034cc:	f8f43023          	sd	a5,-128(s0)
    return sepc;
    800034d0:	f8043783          	ld	a5,-128(s0)
                    uint64 volatile sepc = r_sepc() + 4;
    800034d4:	00478793          	addi	a5,a5,4
    800034d8:	f0f43c23          	sd	a5,-232(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" :  [sstatus] "=r" (sstatus));
    800034dc:	100027f3          	csrr	a5,sstatus
    800034e0:	f6f43c23          	sd	a5,-136(s0)
    return sstatus;
    800034e4:	f7843783          	ld	a5,-136(s0)
                    uint64 volatile sstatus = r_sstatus();
    800034e8:	f2f43023          	sd	a5,-224(s0)
                    ThreadK::timeSliceCounter = 0;
    800034ec:	00005797          	auipc	a5,0x5
    800034f0:	47c7b783          	ld	a5,1148(a5) # 80008968 <_GLOBAL_OFFSET_TABLE_+0x70>
    800034f4:	0007b023          	sd	zero,0(a5)
                    ThreadK::dispatch();
    800034f8:	ffffe097          	auipc	ra,0xffffe
    800034fc:	218080e7          	jalr	536(ra) # 80001710 <_ZN7ThreadK8dispatchEv>
                    w_sstatus(sstatus);
    80003500:	f2043783          	ld	a5,-224(s0)
    __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r" (sstatus));
    80003504:	10079073          	csrw	sstatus,a5
                    w_sepc(sepc);
    80003508:	f1843783          	ld	a5,-232(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r" (sepc));
    8000350c:	14179073          	csrw	sepc,a5
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    80003510:	00000793          	li	a5,0
    80003514:	04f43823          	sd	a5,80(s0)
                    break;
    80003518:	d21ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
    __asm__ volatile ("csrr %[sepc], sepc" :  [sepc] "=r" (sepc));
    8000351c:	141027f3          	csrr	a5,sepc
    80003520:	f8f43823          	sd	a5,-112(s0)
    return sepc;
    80003524:	f9043783          	ld	a5,-112(s0)
                uint64 volatile sepc = r_sepc() + 4;
    80003528:	00478793          	addi	a5,a5,4
    8000352c:	f2f43423          	sd	a5,-216(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" :  [sstatus] "=r" (sstatus));
    80003530:	100027f3          	csrr	a5,sstatus
    80003534:	f8f43423          	sd	a5,-120(s0)
    return sstatus;
    80003538:	f8843783          	ld	a5,-120(s0)
                uint64 volatile sstatus = r_sstatus();
    8000353c:	f2f43823          	sd	a5,-208(s0)
                char c = ConsoleK::kgetc();
    80003540:	00000097          	auipc	ra,0x0
    80003544:	8fc080e7          	jalr	-1796(ra) # 80002e3c <_ZN8ConsoleK5kgetcEv>
                w_sstatus(sstatus);
    80003548:	f3043783          	ld	a5,-208(s0)
    __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r" (sstatus));
    8000354c:	10079073          	csrw	sstatus,a5
                w_sepc(sepc);
    80003550:	f2843783          	ld	a5,-216(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r" (sepc));
    80003554:	14179073          	csrw	sepc,a5
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    80003558:	04a43823          	sd	a0,80(s0)
                break;
    8000355c:	cddff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
                char c = (char)realargs[0];
    80003560:	0005c503          	lbu	a0,0(a1)
    __asm__ volatile ("csrr %[sepc], sepc" :  [sepc] "=r" (sepc));
    80003564:	141027f3          	csrr	a5,sepc
    80003568:	faf43023          	sd	a5,-96(s0)
    return sepc;
    8000356c:	fa043783          	ld	a5,-96(s0)
                uint64 volatile sepc = r_sepc() + 4;
    80003570:	00478793          	addi	a5,a5,4
    80003574:	f2f43c23          	sd	a5,-200(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" :  [sstatus] "=r" (sstatus));
    80003578:	100027f3          	csrr	a5,sstatus
    8000357c:	f8f43c23          	sd	a5,-104(s0)
    return sstatus;
    80003580:	f9843783          	ld	a5,-104(s0)
                uint64 volatile sstatus = r_sstatus();
    80003584:	f4f43023          	sd	a5,-192(s0)
                ConsoleK::kputc(c);
    80003588:	00000097          	auipc	ra,0x0
    8000358c:	87c080e7          	jalr	-1924(ra) # 80002e04 <_ZN8ConsoleK5kputcEc>
                w_sstatus(sstatus);
    80003590:	f4043783          	ld	a5,-192(s0)
    __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r" (sstatus));
    80003594:	10079073          	csrw	sstatus,a5
                w_sepc(sepc);
    80003598:	f3843783          	ld	a5,-200(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r" (sepc));
    8000359c:	14179073          	csrw	sepc,a5
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
    800035a0:	00000793          	li	a5,0
    800035a4:	04f43823          	sd	a5,80(s0)
                break;
    800035a8:	c91ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
        ThreadK::timeSliceCounter++;
    800035ac:	00005717          	auipc	a4,0x5
    800035b0:	3bc73703          	ld	a4,956(a4) # 80008968 <_GLOBAL_OFFSET_TABLE_+0x70>
    800035b4:	00073783          	ld	a5,0(a4)
    800035b8:	00178793          	addi	a5,a5,1
    800035bc:	00f73023          	sd	a5,0(a4)
        if(ThreadK::sleepHead) {
    800035c0:	00005797          	auipc	a5,0x5
    800035c4:	3c07b783          	ld	a5,960(a5) # 80008980 <_GLOBAL_OFFSET_TABLE_+0x88>
    800035c8:	0007b783          	ld	a5,0(a5)
    800035cc:	00078c63          	beqz	a5,800035e4 <_ZN5Riscv10handleTrapEiPv+0x44c>
            ThreadK::sleepHead->sleepTime--;
    800035d0:	0687b703          	ld	a4,104(a5)
    800035d4:	fff70713          	addi	a4,a4,-1
    800035d8:	06e7b423          	sd	a4,104(a5)
            ThreadK::awake();
    800035dc:	ffffe097          	auipc	ra,0xffffe
    800035e0:	364080e7          	jalr	868(ra) # 80001940 <_ZN7ThreadK5awakeEv>
        if (ThreadK::timeSliceCounter >= ThreadK::running->timeSlice) {
    800035e4:	00005797          	auipc	a5,0x5
    800035e8:	35c7b783          	ld	a5,860(a5) # 80008940 <_GLOBAL_OFFSET_TABLE_+0x48>
    800035ec:	0007b783          	ld	a5,0(a5)
    800035f0:	0307b703          	ld	a4,48(a5)
    800035f4:	00005797          	auipc	a5,0x5
    800035f8:	3747b783          	ld	a5,884(a5) # 80008968 <_GLOBAL_OFFSET_TABLE_+0x70>
    800035fc:	0007b783          	ld	a5,0(a5)
    80003600:	00e7f863          	bgeu	a5,a4,80003610 <_ZN5Riscv10handleTrapEiPv+0x478>
    __asm__ volatile("csrc sip, %[mask]" : : [mask] "r" (mask));
    80003604:	20000793          	li	a5,512
    80003608:	1447b073          	csrc	sip,a5
}
    8000360c:	c2dff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>
    __asm__ volatile ("csrr %[sepc], sepc" :  [sepc] "=r" (sepc));
    80003610:	141027f3          	csrr	a5,sepc
    80003614:	faf43823          	sd	a5,-80(s0)
    return sepc;
    80003618:	fb043783          	ld	a5,-80(s0)
            uint64 volatile sepc = r_sepc();
    8000361c:	f4f43423          	sd	a5,-184(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" :  [sstatus] "=r" (sstatus));
    80003620:	100027f3          	csrr	a5,sstatus
    80003624:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    80003628:	fa843783          	ld	a5,-88(s0)
            uint64 volatile sstatus = r_sstatus();
    8000362c:	f4f43823          	sd	a5,-176(s0)
            ThreadK::timeSliceCounter = 0;
    80003630:	00005797          	auipc	a5,0x5
    80003634:	3387b783          	ld	a5,824(a5) # 80008968 <_GLOBAL_OFFSET_TABLE_+0x70>
    80003638:	0007b023          	sd	zero,0(a5)
            ThreadK::dispatch();
    8000363c:	ffffe097          	auipc	ra,0xffffe
    80003640:	0d4080e7          	jalr	212(ra) # 80001710 <_ZN7ThreadK8dispatchEv>
            w_sstatus(sstatus);
    80003644:	f5043783          	ld	a5,-176(s0)
    __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r" (sstatus));
    80003648:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    8000364c:	f4843783          	ld	a5,-184(s0)
    __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r" (sepc));
    80003650:	14179073          	csrw	sepc,a5
}
    80003654:	fb1ff06f          	j	80003604 <_ZN5Riscv10handleTrapEiPv+0x46c>
        ConsoleK::k_console_handler();
    80003658:	00000097          	auipc	ra,0x0
    8000365c:	8f0080e7          	jalr	-1808(ra) # 80002f48 <_ZN8ConsoleK17k_console_handlerEv>
    80003660:	bd9ff06f          	j	80003238 <_ZN5Riscv10handleTrapEiPv+0xa0>

0000000080003664 <_ZN5Riscv10popSppSpieEv>:

void Riscv::popSppSpie() {
    80003664:	fe010113          	addi	sp,sp,-32
    80003668:	00813c23          	sd	s0,24(sp)
    8000366c:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" :  [sstatus] "=r" (sstatus));
    80003670:	100027f3          	csrr	a5,sstatus
    80003674:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80003678:	fe043783          	ld	a5,-32(s0)
    uint64 volatile sstatus;
    sstatus = r_sstatus();
    8000367c:	fef43423          	sd	a5,-24(s0)
    if(ThreadK::running->systemThread){
    80003680:	00005797          	auipc	a5,0x5
    80003684:	2c07b783          	ld	a5,704(a5) # 80008940 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003688:	0007b783          	ld	a5,0(a5)
    8000368c:	0717c783          	lbu	a5,113(a5)
    80003690:	02078c63          	beqz	a5,800036c8 <_ZN5Riscv10popSppSpieEv+0x64>
        sstatus &= ~SSTATUS_SPIE;
    80003694:	fe843783          	ld	a5,-24(s0)
    80003698:	fdf7f793          	andi	a5,a5,-33
    8000369c:	fef43423          	sd	a5,-24(s0)
        sstatus |= SSTATUS_SPP;
    800036a0:	fe843783          	ld	a5,-24(s0)
    800036a4:	1007e793          	ori	a5,a5,256
    800036a8:	fef43423          	sd	a5,-24(s0)
    }
    else{
        sstatus |= SSTATUS_SPIE;
        sstatus &= ~SSTATUS_SPP;
    }
    w_sstatus(sstatus);
    800036ac:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r" (sstatus));
    800036b0:	10079073          	csrw	sstatus,a5
    __asm__ volatile("csrw sepc, ra");
    800036b4:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    800036b8:	10200073          	sret
}
    800036bc:	01813403          	ld	s0,24(sp)
    800036c0:	02010113          	addi	sp,sp,32
    800036c4:	00008067          	ret
        sstatus |= SSTATUS_SPIE;
    800036c8:	fe843783          	ld	a5,-24(s0)
    800036cc:	0207e793          	ori	a5,a5,32
    800036d0:	fef43423          	sd	a5,-24(s0)
        sstatus &= ~SSTATUS_SPP;
    800036d4:	fe843783          	ld	a5,-24(s0)
    800036d8:	eff7f793          	andi	a5,a5,-257
    800036dc:	fef43423          	sd	a5,-24(s0)
    800036e0:	fcdff06f          	j	800036ac <_ZN5Riscv10popSppSpieEv+0x48>

00000000800036e4 <_ZN15MemoryAllocator10initializeEv>:

#include "../h/MemoryAllocator.hpp"

MemoryAllocator* MemoryAllocator:: instance = nullptr;

void MemoryAllocator::initialize() {
    800036e4:	ff010113          	addi	sp,sp,-16
    800036e8:	00813423          	sd	s0,8(sp)
    800036ec:	01010413          	addi	s0,sp,16
    if(instance == nullptr) {
    800036f0:	00005797          	auipc	a5,0x5
    800036f4:	3187b783          	ld	a5,792(a5) # 80008a08 <_ZN15MemoryAllocator8instanceE>
    800036f8:	00078863          	beqz	a5,80003708 <_ZN15MemoryAllocator10initializeEv+0x24>
        instance->free_mem_head = (BlockHeader *) ((char *) HEAP_START_ADDR + sizeof(MemoryAllocator));//initially
        instance->free_mem_head->size =
                (char *) HEAP_END_ADDR - (char *) (instance->free_mem_head) - sizeof(BlockHeader);
        instance->free_mem_head->prev = instance->free_mem_head->next = nullptr;
    }
}
    800036fc:	00813403          	ld	s0,8(sp)
    80003700:	01010113          	addi	sp,sp,16
    80003704:	00008067          	ret
        instance = (MemoryAllocator*) HEAP_START_ADDR;
    80003708:	00005797          	auipc	a5,0x5
    8000370c:	2107b783          	ld	a5,528(a5) # 80008918 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003710:	0007b783          	ld	a5,0(a5)
    80003714:	00005717          	auipc	a4,0x5
    80003718:	2f470713          	addi	a4,a4,756 # 80008a08 <_ZN15MemoryAllocator8instanceE>
    8000371c:	00f73023          	sd	a5,0(a4)
        instance->free_mem_head = (BlockHeader *) ((char *) HEAP_START_ADDR + sizeof(MemoryAllocator));//initially
    80003720:	00878693          	addi	a3,a5,8
    80003724:	00d7b023          	sd	a3,0(a5)
                (char *) HEAP_END_ADDR - (char *) (instance->free_mem_head) - sizeof(BlockHeader);
    80003728:	00005797          	auipc	a5,0x5
    8000372c:	2487b783          	ld	a5,584(a5) # 80008970 <_GLOBAL_OFFSET_TABLE_+0x78>
    80003730:	0007b783          	ld	a5,0(a5)
    80003734:	00073683          	ld	a3,0(a4)
    80003738:	0006b603          	ld	a2,0(a3)
    8000373c:	40c787b3          	sub	a5,a5,a2
    80003740:	fe878793          	addi	a5,a5,-24
        instance->free_mem_head->size =
    80003744:	00f63823          	sd	a5,16(a2)
        instance->free_mem_head->prev = instance->free_mem_head->next = nullptr;
    80003748:	0006b783          	ld	a5,0(a3)
    8000374c:	0007b023          	sd	zero,0(a5)
    80003750:	00073783          	ld	a5,0(a4)
    80003754:	0007b783          	ld	a5,0(a5)
    80003758:	0007b423          	sd	zero,8(a5)
}
    8000375c:	fa1ff06f          	j	800036fc <_ZN15MemoryAllocator10initializeEv+0x18>

0000000080003760 <_ZN15MemoryAllocator10kmem_allocEm>:

void* MemoryAllocator::kmem_alloc(size_t size) {
    80003760:	ff010113          	addi	sp,sp,-16
    80003764:	00813423          	sd	s0,8(sp)
    80003768:	01010413          	addi	s0,sp,16
    size_t realSz = ((size + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE)*MEM_BLOCK_SIZE;
    8000376c:	03f50793          	addi	a5,a0,63
    80003770:	fc07f793          	andi	a5,a5,-64
    if(!realSz || !instance->free_mem_head) return nullptr;
    80003774:	0c078463          	beqz	a5,8000383c <_ZN15MemoryAllocator10kmem_allocEm+0xdc>
    80003778:	00005697          	auipc	a3,0x5
    8000377c:	2906b683          	ld	a3,656(a3) # 80008a08 <_ZN15MemoryAllocator8instanceE>
    80003780:	0006b503          	ld	a0,0(a3)
    80003784:	00051663          	bnez	a0,80003790 <_ZN15MemoryAllocator10kmem_allocEm+0x30>
    80003788:	0a00006f          	j	80003828 <_ZN15MemoryAllocator10kmem_allocEm+0xc8>
    BlockHeader* tmp = instance->free_mem_head;
    //iterating trough list and finding enough big segment;
    while(tmp && tmp->size < realSz){
        tmp = tmp->next;
    8000378c:	00053503          	ld	a0,0(a0)
    while(tmp && tmp->size < realSz){
    80003790:	00050663          	beqz	a0,8000379c <_ZN15MemoryAllocator10kmem_allocEm+0x3c>
    80003794:	01053703          	ld	a4,16(a0)
    80003798:	fef76ae3          	bltu	a4,a5,8000378c <_ZN15MemoryAllocator10kmem_allocEm+0x2c>
    }
    if(!tmp) return nullptr;
    8000379c:	08050663          	beqz	a0,80003828 <_ZN15MemoryAllocator10kmem_allocEm+0xc8>
    if(tmp->size - realSz <= sizeof(BlockHeader) + MEM_BLOCK_SIZE){
    800037a0:	01053703          	ld	a4,16(a0)
    800037a4:	40f70733          	sub	a4,a4,a5
    800037a8:	05800613          	li	a2,88
    800037ac:	02e66a63          	bltu	a2,a4,800037e0 <_ZN15MemoryAllocator10kmem_allocEm+0x80>
        //allocate whole segment
        if(tmp->prev) tmp->prev->next = tmp->next;
    800037b0:	00853783          	ld	a5,8(a0)
    800037b4:	02078063          	beqz	a5,800037d4 <_ZN15MemoryAllocator10kmem_allocEm+0x74>
    800037b8:	00053703          	ld	a4,0(a0)
    800037bc:	00e7b023          	sd	a4,0(a5)
        else instance->free_mem_head = tmp->next;
        if(tmp->next) tmp->next->prev = tmp->prev;
    800037c0:	00053783          	ld	a5,0(a0)
    800037c4:	06078063          	beqz	a5,80003824 <_ZN15MemoryAllocator10kmem_allocEm+0xc4>
    800037c8:	00853703          	ld	a4,8(a0)
    800037cc:	00e7b423          	sd	a4,8(a5)
    800037d0:	0540006f          	j	80003824 <_ZN15MemoryAllocator10kmem_allocEm+0xc4>
        else instance->free_mem_head = tmp->next;
    800037d4:	00053783          	ld	a5,0(a0)
    800037d8:	00f6b023          	sd	a5,0(a3)
    800037dc:	fe5ff06f          	j	800037c0 <_ZN15MemoryAllocator10kmem_allocEm+0x60>
    } else{
        //insert remainder in list, fragment remains
        size_t offset = sizeof(BlockHeader) + realSz;
    800037e0:	01878713          	addi	a4,a5,24
        BlockHeader* newSegment = (BlockHeader*)((char*)tmp + offset);
    800037e4:	00e50733          	add	a4,a0,a4
        if(tmp->prev) tmp->prev->next = newSegment;
    800037e8:	00853603          	ld	a2,8(a0)
    800037ec:	04060463          	beqz	a2,80003834 <_ZN15MemoryAllocator10kmem_allocEm+0xd4>
    800037f0:	00e63023          	sd	a4,0(a2)
        else instance->free_mem_head = newSegment;
        if(tmp->next) tmp->next->prev = newSegment;
    800037f4:	00053683          	ld	a3,0(a0)
    800037f8:	00068463          	beqz	a3,80003800 <_ZN15MemoryAllocator10kmem_allocEm+0xa0>
    800037fc:	00e6b423          	sd	a4,8(a3)
        newSegment->prev = tmp->prev;
    80003800:	00853683          	ld	a3,8(a0)
    80003804:	00d73423          	sd	a3,8(a4)
        newSegment->next = tmp->next;
    80003808:	00053683          	ld	a3,0(a0)
    8000380c:	00d73023          	sd	a3,0(a4)
        newSegment->size = tmp->size - realSz - sizeof(BlockHeader);
    80003810:	01053683          	ld	a3,16(a0)
    80003814:	40f686b3          	sub	a3,a3,a5
    80003818:	fe868693          	addi	a3,a3,-24
    8000381c:	00d73823          	sd	a3,16(a4)
        tmp->size= realSz;
    80003820:	00f53823          	sd	a5,16(a0)
    }
    return (char*)tmp + sizeof(BlockHeader);
    80003824:	01850513          	addi	a0,a0,24
}
    80003828:	00813403          	ld	s0,8(sp)
    8000382c:	01010113          	addi	sp,sp,16
    80003830:	00008067          	ret
        else instance->free_mem_head = newSegment;
    80003834:	00e6b023          	sd	a4,0(a3)
    80003838:	fbdff06f          	j	800037f4 <_ZN15MemoryAllocator10kmem_allocEm+0x94>
    if(!realSz || !instance->free_mem_head) return nullptr;
    8000383c:	00000513          	li	a0,0
    80003840:	fe9ff06f          	j	80003828 <_ZN15MemoryAllocator10kmem_allocEm+0xc8>

0000000080003844 <_ZN15MemoryAllocator12joinSegmentsEPNS_11BlockHeaderE>:
    joinSegments(tmp);
    return 0;

}
//helper function which join this and next segment
int MemoryAllocator::joinSegments(MemoryAllocator::BlockHeader *tmp) {
    80003844:	ff010113          	addi	sp,sp,-16
    80003848:	00813423          	sd	s0,8(sp)
    8000384c:	01010413          	addi	s0,sp,16
    if(!tmp) return -1;
    80003850:	04050e63          	beqz	a0,800038ac <_ZN15MemoryAllocator12joinSegmentsEPNS_11BlockHeaderE+0x68>
    if(tmp->next && (char*)tmp + tmp->size + sizeof(BlockHeader)== (char*)(tmp->next)){
    80003854:	00053703          	ld	a4,0(a0)
    80003858:	04070e63          	beqz	a4,800038b4 <_ZN15MemoryAllocator12joinSegmentsEPNS_11BlockHeaderE+0x70>
    8000385c:	01053783          	ld	a5,16(a0)
    80003860:	01878793          	addi	a5,a5,24
    80003864:	00f507b3          	add	a5,a0,a5
    80003868:	04f71a63          	bne	a4,a5,800038bc <_ZN15MemoryAllocator12joinSegmentsEPNS_11BlockHeaderE+0x78>
        //tmp will take tmp->next segment size
        tmp->next->size += sizeof(BlockHeader);
    8000386c:	01073783          	ld	a5,16(a4)
    80003870:	01878793          	addi	a5,a5,24
    80003874:	00f73823          	sd	a5,16(a4)
        tmp->size += tmp->next->size;
    80003878:	00053703          	ld	a4,0(a0)
    8000387c:	01073683          	ld	a3,16(a4)
    80003880:	01053783          	ld	a5,16(a0)
    80003884:	00d787b3          	add	a5,a5,a3
    80003888:	00f53823          	sd	a5,16(a0)
        tmp->next= tmp->next->next;
    8000388c:	00073783          	ld	a5,0(a4)
    80003890:	00f53023          	sd	a5,0(a0)
        if(tmp->next) tmp->next->prev = tmp;
    80003894:	00078463          	beqz	a5,8000389c <_ZN15MemoryAllocator12joinSegmentsEPNS_11BlockHeaderE+0x58>
    80003898:	00a7b423          	sd	a0,8(a5)
        return 0;
    8000389c:	00000513          	li	a0,0
    }else
    return -1;
}
    800038a0:	00813403          	ld	s0,8(sp)
    800038a4:	01010113          	addi	sp,sp,16
    800038a8:	00008067          	ret
    if(!tmp) return -1;
    800038ac:	fff00513          	li	a0,-1
    800038b0:	ff1ff06f          	j	800038a0 <_ZN15MemoryAllocator12joinSegmentsEPNS_11BlockHeaderE+0x5c>
    return -1;
    800038b4:	fff00513          	li	a0,-1
    800038b8:	fe9ff06f          	j	800038a0 <_ZN15MemoryAllocator12joinSegmentsEPNS_11BlockHeaderE+0x5c>
    800038bc:	fff00513          	li	a0,-1
    800038c0:	fe1ff06f          	j	800038a0 <_ZN15MemoryAllocator12joinSegmentsEPNS_11BlockHeaderE+0x5c>

00000000800038c4 <_ZN15MemoryAllocator9kmem_freeEPv>:
int MemoryAllocator::kmem_free(void *address) {
    800038c4:	00050713          	mv	a4,a0
    if(!address || !instance->free_mem_head) return -1;
    800038c8:	0a050e63          	beqz	a0,80003984 <_ZN15MemoryAllocator9kmem_freeEPv+0xc0>
    800038cc:	fe850513          	addi	a0,a0,-24
    800038d0:	00005797          	auipc	a5,0x5
    800038d4:	1387b783          	ld	a5,312(a5) # 80008a08 <_ZN15MemoryAllocator8instanceE>
    800038d8:	0007b783          	ld	a5,0(a5)
    800038dc:	0a078863          	beqz	a5,8000398c <_ZN15MemoryAllocator9kmem_freeEPv+0xc8>
int MemoryAllocator::kmem_free(void *address) {
    800038e0:	fe010113          	addi	sp,sp,-32
    800038e4:	00113c23          	sd	ra,24(sp)
    800038e8:	00813823          	sd	s0,16(sp)
    800038ec:	00913423          	sd	s1,8(sp)
    800038f0:	02010413          	addi	s0,sp,32
    if (instance->free_mem_head && newAdr >= (char *) (instance->free_mem_head))
    800038f4:	02f56463          	bltu	a0,a5,8000391c <_ZN15MemoryAllocator9kmem_freeEPv+0x58>
        for (tmp = instance->free_mem_head; tmp->next && newAdr > (char *) (tmp->next); tmp = tmp->next);
    800038f8:	00078493          	mv	s1,a5
    800038fc:	0007b783          	ld	a5,0(a5)
    80003900:	00078463          	beqz	a5,80003908 <_ZN15MemoryAllocator9kmem_freeEPv+0x44>
    80003904:	fea7eae3          	bltu	a5,a0,800038f8 <_ZN15MemoryAllocator9kmem_freeEPv+0x34>
    newSegment->prev = tmp;
    80003908:	fe973823          	sd	s1,-16(a4)
    if (tmp) newSegment->next = tmp->next;
    8000390c:	00048c63          	beqz	s1,80003924 <_ZN15MemoryAllocator9kmem_freeEPv+0x60>
    80003910:	0004b783          	ld	a5,0(s1)
    80003914:	fef73423          	sd	a5,-24(a4)
    80003918:	01c0006f          	j	80003934 <_ZN15MemoryAllocator9kmem_freeEPv+0x70>
    newSegment->prev = tmp;
    8000391c:	fe073823          	sd	zero,-16(a4)
    BlockHeader *tmp = nullptr;
    80003920:	00000493          	li	s1,0
    else newSegment->next = instance->free_mem_head;
    80003924:	00005797          	auipc	a5,0x5
    80003928:	0e47b783          	ld	a5,228(a5) # 80008a08 <_ZN15MemoryAllocator8instanceE>
    8000392c:	0007b783          	ld	a5,0(a5)
    80003930:	fef73423          	sd	a5,-24(a4)
    if (newSegment->next) newSegment->next->prev = newSegment;
    80003934:	fe873783          	ld	a5,-24(a4)
    80003938:	00078463          	beqz	a5,80003940 <_ZN15MemoryAllocator9kmem_freeEPv+0x7c>
    8000393c:	00a7b423          	sd	a0,8(a5)
    if (tmp) tmp->next = newSegment;
    80003940:	02048a63          	beqz	s1,80003974 <_ZN15MemoryAllocator9kmem_freeEPv+0xb0>
    80003944:	00a4b023          	sd	a0,0(s1)
    joinSegments(newSegment);
    80003948:	00000097          	auipc	ra,0x0
    8000394c:	efc080e7          	jalr	-260(ra) # 80003844 <_ZN15MemoryAllocator12joinSegmentsEPNS_11BlockHeaderE>
    joinSegments(tmp);
    80003950:	00048513          	mv	a0,s1
    80003954:	00000097          	auipc	ra,0x0
    80003958:	ef0080e7          	jalr	-272(ra) # 80003844 <_ZN15MemoryAllocator12joinSegmentsEPNS_11BlockHeaderE>
    return 0;
    8000395c:	00000513          	li	a0,0
}
    80003960:	01813083          	ld	ra,24(sp)
    80003964:	01013403          	ld	s0,16(sp)
    80003968:	00813483          	ld	s1,8(sp)
    8000396c:	02010113          	addi	sp,sp,32
    80003970:	00008067          	ret
    else instance->free_mem_head = newSegment;
    80003974:	00005797          	auipc	a5,0x5
    80003978:	0947b783          	ld	a5,148(a5) # 80008a08 <_ZN15MemoryAllocator8instanceE>
    8000397c:	00a7b023          	sd	a0,0(a5)
    80003980:	fc9ff06f          	j	80003948 <_ZN15MemoryAllocator9kmem_freeEPv+0x84>
    if(!address || !instance->free_mem_head) return -1;
    80003984:	fff00513          	li	a0,-1
    80003988:	00008067          	ret
    8000398c:	fff00513          	li	a0,-1
}
    80003990:	00008067          	ret

0000000080003994 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80003994:	fe010113          	addi	sp,sp,-32
    80003998:	00113c23          	sd	ra,24(sp)
    8000399c:	00813823          	sd	s0,16(sp)
    800039a0:	00913423          	sd	s1,8(sp)
    800039a4:	02010413          	addi	s0,sp,32
    800039a8:	00050493          	mv	s1,a0
    LOCK();
    800039ac:	00100613          	li	a2,1
    800039b0:	00000593          	li	a1,0
    800039b4:	00005517          	auipc	a0,0x5
    800039b8:	05c50513          	addi	a0,a0,92 # 80008a10 <lockPrint>
    800039bc:	ffffe097          	auipc	ra,0xffffe
    800039c0:	890080e7          	jalr	-1904(ra) # 8000124c <copy_and_swap>
    800039c4:	fe0514e3          	bnez	a0,800039ac <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800039c8:	0004c503          	lbu	a0,0(s1)
    800039cc:	00050a63          	beqz	a0,800039e0 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    800039d0:	ffffe097          	auipc	ra,0xffffe
    800039d4:	bf8080e7          	jalr	-1032(ra) # 800015c8 <_Z4putcc>
        string++;
    800039d8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800039dc:	fedff06f          	j	800039c8 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    800039e0:	00000613          	li	a2,0
    800039e4:	00100593          	li	a1,1
    800039e8:	00005517          	auipc	a0,0x5
    800039ec:	02850513          	addi	a0,a0,40 # 80008a10 <lockPrint>
    800039f0:	ffffe097          	auipc	ra,0xffffe
    800039f4:	85c080e7          	jalr	-1956(ra) # 8000124c <copy_and_swap>
    800039f8:	fe0514e3          	bnez	a0,800039e0 <_Z11printStringPKc+0x4c>
}
    800039fc:	01813083          	ld	ra,24(sp)
    80003a00:	01013403          	ld	s0,16(sp)
    80003a04:	00813483          	ld	s1,8(sp)
    80003a08:	02010113          	addi	sp,sp,32
    80003a0c:	00008067          	ret

0000000080003a10 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80003a10:	fd010113          	addi	sp,sp,-48
    80003a14:	02113423          	sd	ra,40(sp)
    80003a18:	02813023          	sd	s0,32(sp)
    80003a1c:	00913c23          	sd	s1,24(sp)
    80003a20:	01213823          	sd	s2,16(sp)
    80003a24:	01313423          	sd	s3,8(sp)
    80003a28:	01413023          	sd	s4,0(sp)
    80003a2c:	03010413          	addi	s0,sp,48
    80003a30:	00050993          	mv	s3,a0
    80003a34:	00058a13          	mv	s4,a1
    LOCK();
    80003a38:	00100613          	li	a2,1
    80003a3c:	00000593          	li	a1,0
    80003a40:	00005517          	auipc	a0,0x5
    80003a44:	fd050513          	addi	a0,a0,-48 # 80008a10 <lockPrint>
    80003a48:	ffffe097          	auipc	ra,0xffffe
    80003a4c:	804080e7          	jalr	-2044(ra) # 8000124c <copy_and_swap>
    80003a50:	fe0514e3          	bnez	a0,80003a38 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80003a54:	00000913          	li	s2,0
    80003a58:	00090493          	mv	s1,s2
    80003a5c:	0019091b          	addiw	s2,s2,1
    80003a60:	03495a63          	bge	s2,s4,80003a94 <_Z9getStringPci+0x84>
        cc = getc();
    80003a64:	ffffe097          	auipc	ra,0xffffe
    80003a68:	b30080e7          	jalr	-1232(ra) # 80001594 <_Z4getcv>
        if(cc < 1)
    80003a6c:	02050463          	beqz	a0,80003a94 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80003a70:	009984b3          	add	s1,s3,s1
    80003a74:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80003a78:	00a00793          	li	a5,10
    80003a7c:	00f50a63          	beq	a0,a5,80003a90 <_Z9getStringPci+0x80>
    80003a80:	00d00793          	li	a5,13
    80003a84:	fcf51ae3          	bne	a0,a5,80003a58 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80003a88:	00090493          	mv	s1,s2
    80003a8c:	0080006f          	j	80003a94 <_Z9getStringPci+0x84>
    80003a90:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80003a94:	009984b3          	add	s1,s3,s1
    80003a98:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80003a9c:	00000613          	li	a2,0
    80003aa0:	00100593          	li	a1,1
    80003aa4:	00005517          	auipc	a0,0x5
    80003aa8:	f6c50513          	addi	a0,a0,-148 # 80008a10 <lockPrint>
    80003aac:	ffffd097          	auipc	ra,0xffffd
    80003ab0:	7a0080e7          	jalr	1952(ra) # 8000124c <copy_and_swap>
    80003ab4:	fe0514e3          	bnez	a0,80003a9c <_Z9getStringPci+0x8c>
    return buf;
}
    80003ab8:	00098513          	mv	a0,s3
    80003abc:	02813083          	ld	ra,40(sp)
    80003ac0:	02013403          	ld	s0,32(sp)
    80003ac4:	01813483          	ld	s1,24(sp)
    80003ac8:	01013903          	ld	s2,16(sp)
    80003acc:	00813983          	ld	s3,8(sp)
    80003ad0:	00013a03          	ld	s4,0(sp)
    80003ad4:	03010113          	addi	sp,sp,48
    80003ad8:	00008067          	ret

0000000080003adc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80003adc:	ff010113          	addi	sp,sp,-16
    80003ae0:	00813423          	sd	s0,8(sp)
    80003ae4:	01010413          	addi	s0,sp,16
    80003ae8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80003aec:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80003af0:	0006c603          	lbu	a2,0(a3)
    80003af4:	fd06071b          	addiw	a4,a2,-48
    80003af8:	0ff77713          	andi	a4,a4,255
    80003afc:	00900793          	li	a5,9
    80003b00:	02e7e063          	bltu	a5,a4,80003b20 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80003b04:	0025179b          	slliw	a5,a0,0x2
    80003b08:	00a787bb          	addw	a5,a5,a0
    80003b0c:	0017979b          	slliw	a5,a5,0x1
    80003b10:	00168693          	addi	a3,a3,1
    80003b14:	00c787bb          	addw	a5,a5,a2
    80003b18:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80003b1c:	fd5ff06f          	j	80003af0 <_Z11stringToIntPKc+0x14>
    return n;
}
    80003b20:	00813403          	ld	s0,8(sp)
    80003b24:	01010113          	addi	sp,sp,16
    80003b28:	00008067          	ret

0000000080003b2c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80003b2c:	fc010113          	addi	sp,sp,-64
    80003b30:	02113c23          	sd	ra,56(sp)
    80003b34:	02813823          	sd	s0,48(sp)
    80003b38:	02913423          	sd	s1,40(sp)
    80003b3c:	03213023          	sd	s2,32(sp)
    80003b40:	01313c23          	sd	s3,24(sp)
    80003b44:	04010413          	addi	s0,sp,64
    80003b48:	00050493          	mv	s1,a0
    80003b4c:	00058913          	mv	s2,a1
    80003b50:	00060993          	mv	s3,a2
    LOCK();
    80003b54:	00100613          	li	a2,1
    80003b58:	00000593          	li	a1,0
    80003b5c:	00005517          	auipc	a0,0x5
    80003b60:	eb450513          	addi	a0,a0,-332 # 80008a10 <lockPrint>
    80003b64:	ffffd097          	auipc	ra,0xffffd
    80003b68:	6e8080e7          	jalr	1768(ra) # 8000124c <copy_and_swap>
    80003b6c:	fe0514e3          	bnez	a0,80003b54 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003b70:	00098463          	beqz	s3,80003b78 <_Z8printIntiii+0x4c>
    80003b74:	0804c463          	bltz	s1,80003bfc <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80003b78:	0004851b          	sext.w	a0,s1
    neg = 0;
    80003b7c:	00000593          	li	a1,0
    }

    i = 0;
    80003b80:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003b84:	0009079b          	sext.w	a5,s2
    80003b88:	0325773b          	remuw	a4,a0,s2
    80003b8c:	00048613          	mv	a2,s1
    80003b90:	0014849b          	addiw	s1,s1,1
    80003b94:	02071693          	slli	a3,a4,0x20
    80003b98:	0206d693          	srli	a3,a3,0x20
    80003b9c:	00005717          	auipc	a4,0x5
    80003ba0:	d4470713          	addi	a4,a4,-700 # 800088e0 <digits>
    80003ba4:	00d70733          	add	a4,a4,a3
    80003ba8:	00074683          	lbu	a3,0(a4)
    80003bac:	fd040713          	addi	a4,s0,-48
    80003bb0:	00c70733          	add	a4,a4,a2
    80003bb4:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80003bb8:	0005071b          	sext.w	a4,a0
    80003bbc:	0325553b          	divuw	a0,a0,s2
    80003bc0:	fcf772e3          	bgeu	a4,a5,80003b84 <_Z8printIntiii+0x58>
    if(neg)
    80003bc4:	00058c63          	beqz	a1,80003bdc <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80003bc8:	fd040793          	addi	a5,s0,-48
    80003bcc:	009784b3          	add	s1,a5,s1
    80003bd0:	02d00793          	li	a5,45
    80003bd4:	fef48823          	sb	a5,-16(s1)
    80003bd8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003bdc:	fff4849b          	addiw	s1,s1,-1
    80003be0:	0204c463          	bltz	s1,80003c08 <_Z8printIntiii+0xdc>
        putc(buf[i]);
    80003be4:	fd040793          	addi	a5,s0,-48
    80003be8:	009787b3          	add	a5,a5,s1
    80003bec:	ff07c503          	lbu	a0,-16(a5)
    80003bf0:	ffffe097          	auipc	ra,0xffffe
    80003bf4:	9d8080e7          	jalr	-1576(ra) # 800015c8 <_Z4putcc>
    80003bf8:	fe5ff06f          	j	80003bdc <_Z8printIntiii+0xb0>
        x = -xx;
    80003bfc:	4090053b          	negw	a0,s1
        neg = 1;
    80003c00:	00100593          	li	a1,1
        x = -xx;
    80003c04:	f7dff06f          	j	80003b80 <_Z8printIntiii+0x54>

    UNLOCK();
    80003c08:	00000613          	li	a2,0
    80003c0c:	00100593          	li	a1,1
    80003c10:	00005517          	auipc	a0,0x5
    80003c14:	e0050513          	addi	a0,a0,-512 # 80008a10 <lockPrint>
    80003c18:	ffffd097          	auipc	ra,0xffffd
    80003c1c:	634080e7          	jalr	1588(ra) # 8000124c <copy_and_swap>
    80003c20:	fe0514e3          	bnez	a0,80003c08 <_Z8printIntiii+0xdc>
    80003c24:	03813083          	ld	ra,56(sp)
    80003c28:	03013403          	ld	s0,48(sp)
    80003c2c:	02813483          	ld	s1,40(sp)
    80003c30:	02013903          	ld	s2,32(sp)
    80003c34:	01813983          	ld	s3,24(sp)
    80003c38:	04010113          	addi	sp,sp,64
    80003c3c:	00008067          	ret

0000000080003c40 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003c40:	fd010113          	addi	sp,sp,-48
    80003c44:	02113423          	sd	ra,40(sp)
    80003c48:	02813023          	sd	s0,32(sp)
    80003c4c:	00913c23          	sd	s1,24(sp)
    80003c50:	01213823          	sd	s2,16(sp)
    80003c54:	01313423          	sd	s3,8(sp)
    80003c58:	03010413          	addi	s0,sp,48
    80003c5c:	00050493          	mv	s1,a0
    80003c60:	00058913          	mv	s2,a1
    80003c64:	0015879b          	addiw	a5,a1,1
    80003c68:	0007851b          	sext.w	a0,a5
    80003c6c:	00f4a023          	sw	a5,0(s1)
    80003c70:	0004a823          	sw	zero,16(s1)
    80003c74:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003c78:	00251513          	slli	a0,a0,0x2
    80003c7c:	ffffd097          	auipc	ra,0xffffd
    80003c80:	610080e7          	jalr	1552(ra) # 8000128c <_Z9mem_allocm>
    80003c84:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80003c88:	01000513          	li	a0,16
    80003c8c:	fffff097          	auipc	ra,0xfffff
    80003c90:	b64080e7          	jalr	-1180(ra) # 800027f0 <_Znwm>
    80003c94:	00050993          	mv	s3,a0
    80003c98:	00000593          	li	a1,0
    80003c9c:	fffff097          	auipc	ra,0xfffff
    80003ca0:	a74080e7          	jalr	-1420(ra) # 80002710 <_ZN9SemaphoreC1Ej>
    80003ca4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80003ca8:	01000513          	li	a0,16
    80003cac:	fffff097          	auipc	ra,0xfffff
    80003cb0:	b44080e7          	jalr	-1212(ra) # 800027f0 <_Znwm>
    80003cb4:	00050993          	mv	s3,a0
    80003cb8:	00090593          	mv	a1,s2
    80003cbc:	fffff097          	auipc	ra,0xfffff
    80003cc0:	a54080e7          	jalr	-1452(ra) # 80002710 <_ZN9SemaphoreC1Ej>
    80003cc4:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80003cc8:	01000513          	li	a0,16
    80003ccc:	fffff097          	auipc	ra,0xfffff
    80003cd0:	b24080e7          	jalr	-1244(ra) # 800027f0 <_Znwm>
    80003cd4:	00050913          	mv	s2,a0
    80003cd8:	00100593          	li	a1,1
    80003cdc:	fffff097          	auipc	ra,0xfffff
    80003ce0:	a34080e7          	jalr	-1484(ra) # 80002710 <_ZN9SemaphoreC1Ej>
    80003ce4:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80003ce8:	01000513          	li	a0,16
    80003cec:	fffff097          	auipc	ra,0xfffff
    80003cf0:	b04080e7          	jalr	-1276(ra) # 800027f0 <_Znwm>
    80003cf4:	00050913          	mv	s2,a0
    80003cf8:	00100593          	li	a1,1
    80003cfc:	fffff097          	auipc	ra,0xfffff
    80003d00:	a14080e7          	jalr	-1516(ra) # 80002710 <_ZN9SemaphoreC1Ej>
    80003d04:	0324b823          	sd	s2,48(s1)
}
    80003d08:	02813083          	ld	ra,40(sp)
    80003d0c:	02013403          	ld	s0,32(sp)
    80003d10:	01813483          	ld	s1,24(sp)
    80003d14:	01013903          	ld	s2,16(sp)
    80003d18:	00813983          	ld	s3,8(sp)
    80003d1c:	03010113          	addi	sp,sp,48
    80003d20:	00008067          	ret
    80003d24:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80003d28:	00098513          	mv	a0,s3
    80003d2c:	fffff097          	auipc	ra,0xfffff
    80003d30:	b5c080e7          	jalr	-1188(ra) # 80002888 <_ZdlPv>
    80003d34:	00048513          	mv	a0,s1
    80003d38:	00006097          	auipc	ra,0x6
    80003d3c:	db0080e7          	jalr	-592(ra) # 80009ae8 <_Unwind_Resume>
    80003d40:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80003d44:	00098513          	mv	a0,s3
    80003d48:	fffff097          	auipc	ra,0xfffff
    80003d4c:	b40080e7          	jalr	-1216(ra) # 80002888 <_ZdlPv>
    80003d50:	00048513          	mv	a0,s1
    80003d54:	00006097          	auipc	ra,0x6
    80003d58:	d94080e7          	jalr	-620(ra) # 80009ae8 <_Unwind_Resume>
    80003d5c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80003d60:	00090513          	mv	a0,s2
    80003d64:	fffff097          	auipc	ra,0xfffff
    80003d68:	b24080e7          	jalr	-1244(ra) # 80002888 <_ZdlPv>
    80003d6c:	00048513          	mv	a0,s1
    80003d70:	00006097          	auipc	ra,0x6
    80003d74:	d78080e7          	jalr	-648(ra) # 80009ae8 <_Unwind_Resume>
    80003d78:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80003d7c:	00090513          	mv	a0,s2
    80003d80:	fffff097          	auipc	ra,0xfffff
    80003d84:	b08080e7          	jalr	-1272(ra) # 80002888 <_ZdlPv>
    80003d88:	00048513          	mv	a0,s1
    80003d8c:	00006097          	auipc	ra,0x6
    80003d90:	d5c080e7          	jalr	-676(ra) # 80009ae8 <_Unwind_Resume>

0000000080003d94 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80003d94:	fe010113          	addi	sp,sp,-32
    80003d98:	00113c23          	sd	ra,24(sp)
    80003d9c:	00813823          	sd	s0,16(sp)
    80003da0:	00913423          	sd	s1,8(sp)
    80003da4:	01213023          	sd	s2,0(sp)
    80003da8:	02010413          	addi	s0,sp,32
    80003dac:	00050493          	mv	s1,a0
    80003db0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80003db4:	01853503          	ld	a0,24(a0)
    80003db8:	fffff097          	auipc	ra,0xfffff
    80003dbc:	990080e7          	jalr	-1648(ra) # 80002748 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80003dc0:	0304b503          	ld	a0,48(s1)
    80003dc4:	fffff097          	auipc	ra,0xfffff
    80003dc8:	984080e7          	jalr	-1660(ra) # 80002748 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80003dcc:	0084b783          	ld	a5,8(s1)
    80003dd0:	0144a703          	lw	a4,20(s1)
    80003dd4:	00271713          	slli	a4,a4,0x2
    80003dd8:	00e787b3          	add	a5,a5,a4
    80003ddc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003de0:	0144a783          	lw	a5,20(s1)
    80003de4:	0017879b          	addiw	a5,a5,1
    80003de8:	0004a703          	lw	a4,0(s1)
    80003dec:	02e7e7bb          	remw	a5,a5,a4
    80003df0:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80003df4:	0304b503          	ld	a0,48(s1)
    80003df8:	fffff097          	auipc	ra,0xfffff
    80003dfc:	97c080e7          	jalr	-1668(ra) # 80002774 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80003e00:	0204b503          	ld	a0,32(s1)
    80003e04:	fffff097          	auipc	ra,0xfffff
    80003e08:	970080e7          	jalr	-1680(ra) # 80002774 <_ZN9Semaphore6signalEv>

}
    80003e0c:	01813083          	ld	ra,24(sp)
    80003e10:	01013403          	ld	s0,16(sp)
    80003e14:	00813483          	ld	s1,8(sp)
    80003e18:	00013903          	ld	s2,0(sp)
    80003e1c:	02010113          	addi	sp,sp,32
    80003e20:	00008067          	ret

0000000080003e24 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80003e24:	fe010113          	addi	sp,sp,-32
    80003e28:	00113c23          	sd	ra,24(sp)
    80003e2c:	00813823          	sd	s0,16(sp)
    80003e30:	00913423          	sd	s1,8(sp)
    80003e34:	01213023          	sd	s2,0(sp)
    80003e38:	02010413          	addi	s0,sp,32
    80003e3c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80003e40:	02053503          	ld	a0,32(a0)
    80003e44:	fffff097          	auipc	ra,0xfffff
    80003e48:	904080e7          	jalr	-1788(ra) # 80002748 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80003e4c:	0284b503          	ld	a0,40(s1)
    80003e50:	fffff097          	auipc	ra,0xfffff
    80003e54:	8f8080e7          	jalr	-1800(ra) # 80002748 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80003e58:	0084b703          	ld	a4,8(s1)
    80003e5c:	0104a783          	lw	a5,16(s1)
    80003e60:	00279693          	slli	a3,a5,0x2
    80003e64:	00d70733          	add	a4,a4,a3
    80003e68:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80003e6c:	0017879b          	addiw	a5,a5,1
    80003e70:	0004a703          	lw	a4,0(s1)
    80003e74:	02e7e7bb          	remw	a5,a5,a4
    80003e78:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80003e7c:	0284b503          	ld	a0,40(s1)
    80003e80:	fffff097          	auipc	ra,0xfffff
    80003e84:	8f4080e7          	jalr	-1804(ra) # 80002774 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80003e88:	0184b503          	ld	a0,24(s1)
    80003e8c:	fffff097          	auipc	ra,0xfffff
    80003e90:	8e8080e7          	jalr	-1816(ra) # 80002774 <_ZN9Semaphore6signalEv>

    return ret;
}
    80003e94:	00090513          	mv	a0,s2
    80003e98:	01813083          	ld	ra,24(sp)
    80003e9c:	01013403          	ld	s0,16(sp)
    80003ea0:	00813483          	ld	s1,8(sp)
    80003ea4:	00013903          	ld	s2,0(sp)
    80003ea8:	02010113          	addi	sp,sp,32
    80003eac:	00008067          	ret

0000000080003eb0 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80003eb0:	fe010113          	addi	sp,sp,-32
    80003eb4:	00113c23          	sd	ra,24(sp)
    80003eb8:	00813823          	sd	s0,16(sp)
    80003ebc:	00913423          	sd	s1,8(sp)
    80003ec0:	01213023          	sd	s2,0(sp)
    80003ec4:	02010413          	addi	s0,sp,32
    80003ec8:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80003ecc:	02853503          	ld	a0,40(a0)
    80003ed0:	fffff097          	auipc	ra,0xfffff
    80003ed4:	878080e7          	jalr	-1928(ra) # 80002748 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80003ed8:	0304b503          	ld	a0,48(s1)
    80003edc:	fffff097          	auipc	ra,0xfffff
    80003ee0:	86c080e7          	jalr	-1940(ra) # 80002748 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80003ee4:	0144a783          	lw	a5,20(s1)
    80003ee8:	0104a903          	lw	s2,16(s1)
    80003eec:	0327ce63          	blt	a5,s2,80003f28 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80003ef0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80003ef4:	0304b503          	ld	a0,48(s1)
    80003ef8:	fffff097          	auipc	ra,0xfffff
    80003efc:	87c080e7          	jalr	-1924(ra) # 80002774 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80003f00:	0284b503          	ld	a0,40(s1)
    80003f04:	fffff097          	auipc	ra,0xfffff
    80003f08:	870080e7          	jalr	-1936(ra) # 80002774 <_ZN9Semaphore6signalEv>

    return ret;
}
    80003f0c:	00090513          	mv	a0,s2
    80003f10:	01813083          	ld	ra,24(sp)
    80003f14:	01013403          	ld	s0,16(sp)
    80003f18:	00813483          	ld	s1,8(sp)
    80003f1c:	00013903          	ld	s2,0(sp)
    80003f20:	02010113          	addi	sp,sp,32
    80003f24:	00008067          	ret
        ret = cap - head + tail;
    80003f28:	0004a703          	lw	a4,0(s1)
    80003f2c:	4127093b          	subw	s2,a4,s2
    80003f30:	00f9093b          	addw	s2,s2,a5
    80003f34:	fc1ff06f          	j	80003ef4 <_ZN9BufferCPP6getCntEv+0x44>

0000000080003f38 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80003f38:	fe010113          	addi	sp,sp,-32
    80003f3c:	00113c23          	sd	ra,24(sp)
    80003f40:	00813823          	sd	s0,16(sp)
    80003f44:	00913423          	sd	s1,8(sp)
    80003f48:	02010413          	addi	s0,sp,32
    80003f4c:	00050493          	mv	s1,a0
    Console::putc('\n');
    80003f50:	00a00513          	li	a0,10
    80003f54:	fffff097          	auipc	ra,0xfffff
    80003f58:	874080e7          	jalr	-1932(ra) # 800027c8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80003f5c:	00003517          	auipc	a0,0x3
    80003f60:	1ec50513          	addi	a0,a0,492 # 80007148 <CONSOLE_STATUS+0x138>
    80003f64:	00000097          	auipc	ra,0x0
    80003f68:	a30080e7          	jalr	-1488(ra) # 80003994 <_Z11printStringPKc>
    while (getCnt()) {
    80003f6c:	00048513          	mv	a0,s1
    80003f70:	00000097          	auipc	ra,0x0
    80003f74:	f40080e7          	jalr	-192(ra) # 80003eb0 <_ZN9BufferCPP6getCntEv>
    80003f78:	02050c63          	beqz	a0,80003fb0 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80003f7c:	0084b783          	ld	a5,8(s1)
    80003f80:	0104a703          	lw	a4,16(s1)
    80003f84:	00271713          	slli	a4,a4,0x2
    80003f88:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80003f8c:	0007c503          	lbu	a0,0(a5)
    80003f90:	fffff097          	auipc	ra,0xfffff
    80003f94:	838080e7          	jalr	-1992(ra) # 800027c8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80003f98:	0104a783          	lw	a5,16(s1)
    80003f9c:	0017879b          	addiw	a5,a5,1
    80003fa0:	0004a703          	lw	a4,0(s1)
    80003fa4:	02e7e7bb          	remw	a5,a5,a4
    80003fa8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80003fac:	fc1ff06f          	j	80003f6c <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80003fb0:	02100513          	li	a0,33
    80003fb4:	fffff097          	auipc	ra,0xfffff
    80003fb8:	814080e7          	jalr	-2028(ra) # 800027c8 <_ZN7Console4putcEc>
    Console::putc('\n');
    80003fbc:	00a00513          	li	a0,10
    80003fc0:	fffff097          	auipc	ra,0xfffff
    80003fc4:	808080e7          	jalr	-2040(ra) # 800027c8 <_ZN7Console4putcEc>
    mem_free(buffer);
    80003fc8:	0084b503          	ld	a0,8(s1)
    80003fcc:	ffffd097          	auipc	ra,0xffffd
    80003fd0:	2fc080e7          	jalr	764(ra) # 800012c8 <_Z8mem_freePv>
    delete itemAvailable;
    80003fd4:	0204b503          	ld	a0,32(s1)
    80003fd8:	00050863          	beqz	a0,80003fe8 <_ZN9BufferCPPD1Ev+0xb0>
    80003fdc:	00053783          	ld	a5,0(a0)
    80003fe0:	0087b783          	ld	a5,8(a5)
    80003fe4:	000780e7          	jalr	a5
    delete spaceAvailable;
    80003fe8:	0184b503          	ld	a0,24(s1)
    80003fec:	00050863          	beqz	a0,80003ffc <_ZN9BufferCPPD1Ev+0xc4>
    80003ff0:	00053783          	ld	a5,0(a0)
    80003ff4:	0087b783          	ld	a5,8(a5)
    80003ff8:	000780e7          	jalr	a5
    delete mutexTail;
    80003ffc:	0304b503          	ld	a0,48(s1)
    80004000:	00050863          	beqz	a0,80004010 <_ZN9BufferCPPD1Ev+0xd8>
    80004004:	00053783          	ld	a5,0(a0)
    80004008:	0087b783          	ld	a5,8(a5)
    8000400c:	000780e7          	jalr	a5
    delete mutexHead;
    80004010:	0284b503          	ld	a0,40(s1)
    80004014:	00050863          	beqz	a0,80004024 <_ZN9BufferCPPD1Ev+0xec>
    80004018:	00053783          	ld	a5,0(a0)
    8000401c:	0087b783          	ld	a5,8(a5)
    80004020:	000780e7          	jalr	a5
}
    80004024:	01813083          	ld	ra,24(sp)
    80004028:	01013403          	ld	s0,16(sp)
    8000402c:	00813483          	ld	s1,8(sp)
    80004030:	02010113          	addi	sp,sp,32
    80004034:	00008067          	ret

0000000080004038 <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    80004038:	ff010113          	addi	sp,sp,-16
    8000403c:	00813423          	sd	s0,8(sp)
    80004040:	01010413          	addi	s0,sp,16
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    80004044:	00813403          	ld	s0,8(sp)
    80004048:	01010113          	addi	sp,sp,16
    8000404c:	00008067          	ret

0000000080004050 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004050:	fe010113          	addi	sp,sp,-32
    80004054:	00113c23          	sd	ra,24(sp)
    80004058:	00813823          	sd	s0,16(sp)
    8000405c:	00913423          	sd	s1,8(sp)
    80004060:	01213023          	sd	s2,0(sp)
    80004064:	02010413          	addi	s0,sp,32
    80004068:	00050493          	mv	s1,a0
    8000406c:	00058913          	mv	s2,a1
    80004070:	0015879b          	addiw	a5,a1,1
    80004074:	0007851b          	sext.w	a0,a5
    80004078:	00f4a023          	sw	a5,0(s1)
    8000407c:	0004a823          	sw	zero,16(s1)
    80004080:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004084:	00251513          	slli	a0,a0,0x2
    80004088:	ffffd097          	auipc	ra,0xffffd
    8000408c:	204080e7          	jalr	516(ra) # 8000128c <_Z9mem_allocm>
    80004090:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004094:	00000593          	li	a1,0
    80004098:	02048513          	addi	a0,s1,32
    8000409c:	ffffd097          	auipc	ra,0xffffd
    800040a0:	374080e7          	jalr	884(ra) # 80001410 <_Z8sem_openPP10SemaphoreKj>
    sem_open(&spaceAvailable, _cap);
    800040a4:	00090593          	mv	a1,s2
    800040a8:	01848513          	addi	a0,s1,24
    800040ac:	ffffd097          	auipc	ra,0xffffd
    800040b0:	364080e7          	jalr	868(ra) # 80001410 <_Z8sem_openPP10SemaphoreKj>
    sem_open(&mutexHead, 1);
    800040b4:	00100593          	li	a1,1
    800040b8:	02848513          	addi	a0,s1,40
    800040bc:	ffffd097          	auipc	ra,0xffffd
    800040c0:	354080e7          	jalr	852(ra) # 80001410 <_Z8sem_openPP10SemaphoreKj>
    sem_open(&mutexTail, 1);
    800040c4:	00100593          	li	a1,1
    800040c8:	03048513          	addi	a0,s1,48
    800040cc:	ffffd097          	auipc	ra,0xffffd
    800040d0:	344080e7          	jalr	836(ra) # 80001410 <_Z8sem_openPP10SemaphoreKj>
}
    800040d4:	01813083          	ld	ra,24(sp)
    800040d8:	01013403          	ld	s0,16(sp)
    800040dc:	00813483          	ld	s1,8(sp)
    800040e0:	00013903          	ld	s2,0(sp)
    800040e4:	02010113          	addi	sp,sp,32
    800040e8:	00008067          	ret

00000000800040ec <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800040ec:	fe010113          	addi	sp,sp,-32
    800040f0:	00113c23          	sd	ra,24(sp)
    800040f4:	00813823          	sd	s0,16(sp)
    800040f8:	00913423          	sd	s1,8(sp)
    800040fc:	01213023          	sd	s2,0(sp)
    80004100:	02010413          	addi	s0,sp,32
    80004104:	00050493          	mv	s1,a0
    80004108:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    8000410c:	01853503          	ld	a0,24(a0)
    80004110:	ffffd097          	auipc	ra,0xffffd
    80004114:	3a0080e7          	jalr	928(ra) # 800014b0 <_Z8sem_waitP10SemaphoreK>

    sem_wait(mutexTail);
    80004118:	0304b503          	ld	a0,48(s1)
    8000411c:	ffffd097          	auipc	ra,0xffffd
    80004120:	394080e7          	jalr	916(ra) # 800014b0 <_Z8sem_waitP10SemaphoreK>
    buffer[tail] = val;
    80004124:	0084b783          	ld	a5,8(s1)
    80004128:	0144a703          	lw	a4,20(s1)
    8000412c:	00271713          	slli	a4,a4,0x2
    80004130:	00e787b3          	add	a5,a5,a4
    80004134:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004138:	0144a783          	lw	a5,20(s1)
    8000413c:	0017879b          	addiw	a5,a5,1
    80004140:	0004a703          	lw	a4,0(s1)
    80004144:	02e7e7bb          	remw	a5,a5,a4
    80004148:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    8000414c:	0304b503          	ld	a0,48(s1)
    80004150:	ffffd097          	auipc	ra,0xffffd
    80004154:	3b0080e7          	jalr	944(ra) # 80001500 <_Z10sem_signalP10SemaphoreK>

    sem_signal(itemAvailable);
    80004158:	0204b503          	ld	a0,32(s1)
    8000415c:	ffffd097          	auipc	ra,0xffffd
    80004160:	3a4080e7          	jalr	932(ra) # 80001500 <_Z10sem_signalP10SemaphoreK>

}
    80004164:	01813083          	ld	ra,24(sp)
    80004168:	01013403          	ld	s0,16(sp)
    8000416c:	00813483          	ld	s1,8(sp)
    80004170:	00013903          	ld	s2,0(sp)
    80004174:	02010113          	addi	sp,sp,32
    80004178:	00008067          	ret

000000008000417c <_ZN6Buffer3getEv>:

int Buffer::get() {
    8000417c:	fe010113          	addi	sp,sp,-32
    80004180:	00113c23          	sd	ra,24(sp)
    80004184:	00813823          	sd	s0,16(sp)
    80004188:	00913423          	sd	s1,8(sp)
    8000418c:	01213023          	sd	s2,0(sp)
    80004190:	02010413          	addi	s0,sp,32
    80004194:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80004198:	02053503          	ld	a0,32(a0)
    8000419c:	ffffd097          	auipc	ra,0xffffd
    800041a0:	314080e7          	jalr	788(ra) # 800014b0 <_Z8sem_waitP10SemaphoreK>

    sem_wait(mutexHead);
    800041a4:	0284b503          	ld	a0,40(s1)
    800041a8:	ffffd097          	auipc	ra,0xffffd
    800041ac:	308080e7          	jalr	776(ra) # 800014b0 <_Z8sem_waitP10SemaphoreK>

    int ret = buffer[head];
    800041b0:	0084b703          	ld	a4,8(s1)
    800041b4:	0104a783          	lw	a5,16(s1)
    800041b8:	00279693          	slli	a3,a5,0x2
    800041bc:	00d70733          	add	a4,a4,a3
    800041c0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800041c4:	0017879b          	addiw	a5,a5,1
    800041c8:	0004a703          	lw	a4,0(s1)
    800041cc:	02e7e7bb          	remw	a5,a5,a4
    800041d0:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800041d4:	0284b503          	ld	a0,40(s1)
    800041d8:	ffffd097          	auipc	ra,0xffffd
    800041dc:	328080e7          	jalr	808(ra) # 80001500 <_Z10sem_signalP10SemaphoreK>

    sem_signal(spaceAvailable);
    800041e0:	0184b503          	ld	a0,24(s1)
    800041e4:	ffffd097          	auipc	ra,0xffffd
    800041e8:	31c080e7          	jalr	796(ra) # 80001500 <_Z10sem_signalP10SemaphoreK>

    return ret;
}
    800041ec:	00090513          	mv	a0,s2
    800041f0:	01813083          	ld	ra,24(sp)
    800041f4:	01013403          	ld	s0,16(sp)
    800041f8:	00813483          	ld	s1,8(sp)
    800041fc:	00013903          	ld	s2,0(sp)
    80004200:	02010113          	addi	sp,sp,32
    80004204:	00008067          	ret

0000000080004208 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80004208:	fe010113          	addi	sp,sp,-32
    8000420c:	00113c23          	sd	ra,24(sp)
    80004210:	00813823          	sd	s0,16(sp)
    80004214:	00913423          	sd	s1,8(sp)
    80004218:	01213023          	sd	s2,0(sp)
    8000421c:	02010413          	addi	s0,sp,32
    80004220:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80004224:	02853503          	ld	a0,40(a0)
    80004228:	ffffd097          	auipc	ra,0xffffd
    8000422c:	288080e7          	jalr	648(ra) # 800014b0 <_Z8sem_waitP10SemaphoreK>
    sem_wait(mutexTail);
    80004230:	0304b503          	ld	a0,48(s1)
    80004234:	ffffd097          	auipc	ra,0xffffd
    80004238:	27c080e7          	jalr	636(ra) # 800014b0 <_Z8sem_waitP10SemaphoreK>

    if (tail >= head) {
    8000423c:	0144a783          	lw	a5,20(s1)
    80004240:	0104a903          	lw	s2,16(s1)
    80004244:	0327ce63          	blt	a5,s2,80004280 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80004248:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    8000424c:	0304b503          	ld	a0,48(s1)
    80004250:	ffffd097          	auipc	ra,0xffffd
    80004254:	2b0080e7          	jalr	688(ra) # 80001500 <_Z10sem_signalP10SemaphoreK>
    sem_signal(mutexHead);
    80004258:	0284b503          	ld	a0,40(s1)
    8000425c:	ffffd097          	auipc	ra,0xffffd
    80004260:	2a4080e7          	jalr	676(ra) # 80001500 <_Z10sem_signalP10SemaphoreK>

    return ret;
}
    80004264:	00090513          	mv	a0,s2
    80004268:	01813083          	ld	ra,24(sp)
    8000426c:	01013403          	ld	s0,16(sp)
    80004270:	00813483          	ld	s1,8(sp)
    80004274:	00013903          	ld	s2,0(sp)
    80004278:	02010113          	addi	sp,sp,32
    8000427c:	00008067          	ret
        ret = cap - head + tail;
    80004280:	0004a703          	lw	a4,0(s1)
    80004284:	4127093b          	subw	s2,a4,s2
    80004288:	00f9093b          	addw	s2,s2,a5
    8000428c:	fc1ff06f          	j	8000424c <_ZN6Buffer6getCntEv+0x44>

0000000080004290 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80004290:	fe010113          	addi	sp,sp,-32
    80004294:	00113c23          	sd	ra,24(sp)
    80004298:	00813823          	sd	s0,16(sp)
    8000429c:	00913423          	sd	s1,8(sp)
    800042a0:	02010413          	addi	s0,sp,32
    800042a4:	00050493          	mv	s1,a0
    putc('\n');
    800042a8:	00a00513          	li	a0,10
    800042ac:	ffffd097          	auipc	ra,0xffffd
    800042b0:	31c080e7          	jalr	796(ra) # 800015c8 <_Z4putcc>
    printString("Buffer deleted!\n");
    800042b4:	00003517          	auipc	a0,0x3
    800042b8:	e9450513          	addi	a0,a0,-364 # 80007148 <CONSOLE_STATUS+0x138>
    800042bc:	fffff097          	auipc	ra,0xfffff
    800042c0:	6d8080e7          	jalr	1752(ra) # 80003994 <_Z11printStringPKc>
    while (getCnt() > 0) {
    800042c4:	00048513          	mv	a0,s1
    800042c8:	00000097          	auipc	ra,0x0
    800042cc:	f40080e7          	jalr	-192(ra) # 80004208 <_ZN6Buffer6getCntEv>
    800042d0:	02a05c63          	blez	a0,80004308 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800042d4:	0084b783          	ld	a5,8(s1)
    800042d8:	0104a703          	lw	a4,16(s1)
    800042dc:	00271713          	slli	a4,a4,0x2
    800042e0:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800042e4:	0007c503          	lbu	a0,0(a5)
    800042e8:	ffffd097          	auipc	ra,0xffffd
    800042ec:	2e0080e7          	jalr	736(ra) # 800015c8 <_Z4putcc>
        head = (head + 1) % cap;
    800042f0:	0104a783          	lw	a5,16(s1)
    800042f4:	0017879b          	addiw	a5,a5,1
    800042f8:	0004a703          	lw	a4,0(s1)
    800042fc:	02e7e7bb          	remw	a5,a5,a4
    80004300:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80004304:	fc1ff06f          	j	800042c4 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80004308:	02100513          	li	a0,33
    8000430c:	ffffd097          	auipc	ra,0xffffd
    80004310:	2bc080e7          	jalr	700(ra) # 800015c8 <_Z4putcc>
    putc('\n');
    80004314:	00a00513          	li	a0,10
    80004318:	ffffd097          	auipc	ra,0xffffd
    8000431c:	2b0080e7          	jalr	688(ra) # 800015c8 <_Z4putcc>
    mem_free(buffer);
    80004320:	0084b503          	ld	a0,8(s1)
    80004324:	ffffd097          	auipc	ra,0xffffd
    80004328:	fa4080e7          	jalr	-92(ra) # 800012c8 <_Z8mem_freePv>
    sem_close(itemAvailable);
    8000432c:	0204b503          	ld	a0,32(s1)
    80004330:	ffffd097          	auipc	ra,0xffffd
    80004334:	130080e7          	jalr	304(ra) # 80001460 <_Z9sem_closeP10SemaphoreK>
    sem_close(spaceAvailable);
    80004338:	0184b503          	ld	a0,24(s1)
    8000433c:	ffffd097          	auipc	ra,0xffffd
    80004340:	124080e7          	jalr	292(ra) # 80001460 <_Z9sem_closeP10SemaphoreK>
    sem_close(mutexTail);
    80004344:	0304b503          	ld	a0,48(s1)
    80004348:	ffffd097          	auipc	ra,0xffffd
    8000434c:	118080e7          	jalr	280(ra) # 80001460 <_Z9sem_closeP10SemaphoreK>
    sem_close(mutexHead);
    80004350:	0284b503          	ld	a0,40(s1)
    80004354:	ffffd097          	auipc	ra,0xffffd
    80004358:	10c080e7          	jalr	268(ra) # 80001460 <_Z9sem_closeP10SemaphoreK>
}
    8000435c:	01813083          	ld	ra,24(sp)
    80004360:	01013403          	ld	s0,16(sp)
    80004364:	00813483          	ld	s1,8(sp)
    80004368:	02010113          	addi	sp,sp,32
    8000436c:	00008067          	ret

0000000080004370 <start>:
    80004370:	ff010113          	addi	sp,sp,-16
    80004374:	00813423          	sd	s0,8(sp)
    80004378:	01010413          	addi	s0,sp,16
    8000437c:	300027f3          	csrr	a5,mstatus
    80004380:	ffffe737          	lui	a4,0xffffe
    80004384:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff4b7f>
    80004388:	00e7f7b3          	and	a5,a5,a4
    8000438c:	00001737          	lui	a4,0x1
    80004390:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004394:	00e7e7b3          	or	a5,a5,a4
    80004398:	30079073          	csrw	mstatus,a5
    8000439c:	00000797          	auipc	a5,0x0
    800043a0:	16078793          	addi	a5,a5,352 # 800044fc <system_main>
    800043a4:	34179073          	csrw	mepc,a5
    800043a8:	00000793          	li	a5,0
    800043ac:	18079073          	csrw	satp,a5
    800043b0:	000107b7          	lui	a5,0x10
    800043b4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800043b8:	30279073          	csrw	medeleg,a5
    800043bc:	30379073          	csrw	mideleg,a5
    800043c0:	104027f3          	csrr	a5,sie
    800043c4:	2227e793          	ori	a5,a5,546
    800043c8:	10479073          	csrw	sie,a5
    800043cc:	fff00793          	li	a5,-1
    800043d0:	00a7d793          	srli	a5,a5,0xa
    800043d4:	3b079073          	csrw	pmpaddr0,a5
    800043d8:	00f00793          	li	a5,15
    800043dc:	3a079073          	csrw	pmpcfg0,a5
    800043e0:	f14027f3          	csrr	a5,mhartid
    800043e4:	0200c737          	lui	a4,0x200c
    800043e8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800043ec:	0007869b          	sext.w	a3,a5
    800043f0:	00269713          	slli	a4,a3,0x2
    800043f4:	000f4637          	lui	a2,0xf4
    800043f8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800043fc:	00d70733          	add	a4,a4,a3
    80004400:	0037979b          	slliw	a5,a5,0x3
    80004404:	020046b7          	lui	a3,0x2004
    80004408:	00d787b3          	add	a5,a5,a3
    8000440c:	00c585b3          	add	a1,a1,a2
    80004410:	00371693          	slli	a3,a4,0x3
    80004414:	00004717          	auipc	a4,0x4
    80004418:	60c70713          	addi	a4,a4,1548 # 80008a20 <timer_scratch>
    8000441c:	00b7b023          	sd	a1,0(a5)
    80004420:	00d70733          	add	a4,a4,a3
    80004424:	00f73c23          	sd	a5,24(a4)
    80004428:	02c73023          	sd	a2,32(a4)
    8000442c:	34071073          	csrw	mscratch,a4
    80004430:	00000797          	auipc	a5,0x0
    80004434:	6e078793          	addi	a5,a5,1760 # 80004b10 <timervec>
    80004438:	30579073          	csrw	mtvec,a5
    8000443c:	300027f3          	csrr	a5,mstatus
    80004440:	0087e793          	ori	a5,a5,8
    80004444:	30079073          	csrw	mstatus,a5
    80004448:	304027f3          	csrr	a5,mie
    8000444c:	0807e793          	ori	a5,a5,128
    80004450:	30479073          	csrw	mie,a5
    80004454:	f14027f3          	csrr	a5,mhartid
    80004458:	0007879b          	sext.w	a5,a5
    8000445c:	00078213          	mv	tp,a5
    80004460:	30200073          	mret
    80004464:	00813403          	ld	s0,8(sp)
    80004468:	01010113          	addi	sp,sp,16
    8000446c:	00008067          	ret

0000000080004470 <timerinit>:
    80004470:	ff010113          	addi	sp,sp,-16
    80004474:	00813423          	sd	s0,8(sp)
    80004478:	01010413          	addi	s0,sp,16
    8000447c:	f14027f3          	csrr	a5,mhartid
    80004480:	0200c737          	lui	a4,0x200c
    80004484:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80004488:	0007869b          	sext.w	a3,a5
    8000448c:	00269713          	slli	a4,a3,0x2
    80004490:	000f4637          	lui	a2,0xf4
    80004494:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004498:	00d70733          	add	a4,a4,a3
    8000449c:	0037979b          	slliw	a5,a5,0x3
    800044a0:	020046b7          	lui	a3,0x2004
    800044a4:	00d787b3          	add	a5,a5,a3
    800044a8:	00c585b3          	add	a1,a1,a2
    800044ac:	00371693          	slli	a3,a4,0x3
    800044b0:	00004717          	auipc	a4,0x4
    800044b4:	57070713          	addi	a4,a4,1392 # 80008a20 <timer_scratch>
    800044b8:	00b7b023          	sd	a1,0(a5)
    800044bc:	00d70733          	add	a4,a4,a3
    800044c0:	00f73c23          	sd	a5,24(a4)
    800044c4:	02c73023          	sd	a2,32(a4)
    800044c8:	34071073          	csrw	mscratch,a4
    800044cc:	00000797          	auipc	a5,0x0
    800044d0:	64478793          	addi	a5,a5,1604 # 80004b10 <timervec>
    800044d4:	30579073          	csrw	mtvec,a5
    800044d8:	300027f3          	csrr	a5,mstatus
    800044dc:	0087e793          	ori	a5,a5,8
    800044e0:	30079073          	csrw	mstatus,a5
    800044e4:	304027f3          	csrr	a5,mie
    800044e8:	0807e793          	ori	a5,a5,128
    800044ec:	30479073          	csrw	mie,a5
    800044f0:	00813403          	ld	s0,8(sp)
    800044f4:	01010113          	addi	sp,sp,16
    800044f8:	00008067          	ret

00000000800044fc <system_main>:
    800044fc:	fe010113          	addi	sp,sp,-32
    80004500:	00813823          	sd	s0,16(sp)
    80004504:	00913423          	sd	s1,8(sp)
    80004508:	00113c23          	sd	ra,24(sp)
    8000450c:	02010413          	addi	s0,sp,32
    80004510:	00000097          	auipc	ra,0x0
    80004514:	0c4080e7          	jalr	196(ra) # 800045d4 <cpuid>
    80004518:	00004497          	auipc	s1,0x4
    8000451c:	48848493          	addi	s1,s1,1160 # 800089a0 <started>
    80004520:	02050263          	beqz	a0,80004544 <system_main+0x48>
    80004524:	0004a783          	lw	a5,0(s1)
    80004528:	0007879b          	sext.w	a5,a5
    8000452c:	fe078ce3          	beqz	a5,80004524 <system_main+0x28>
    80004530:	0ff0000f          	fence
    80004534:	00003517          	auipc	a0,0x3
    80004538:	c5c50513          	addi	a0,a0,-932 # 80007190 <CONSOLE_STATUS+0x180>
    8000453c:	00001097          	auipc	ra,0x1
    80004540:	a70080e7          	jalr	-1424(ra) # 80004fac <panic>
    80004544:	00001097          	auipc	ra,0x1
    80004548:	9c4080e7          	jalr	-1596(ra) # 80004f08 <consoleinit>
    8000454c:	00001097          	auipc	ra,0x1
    80004550:	150080e7          	jalr	336(ra) # 8000569c <printfinit>
    80004554:	00003517          	auipc	a0,0x3
    80004558:	d1c50513          	addi	a0,a0,-740 # 80007270 <CONSOLE_STATUS+0x260>
    8000455c:	00001097          	auipc	ra,0x1
    80004560:	aac080e7          	jalr	-1364(ra) # 80005008 <__printf>
    80004564:	00003517          	auipc	a0,0x3
    80004568:	bfc50513          	addi	a0,a0,-1028 # 80007160 <CONSOLE_STATUS+0x150>
    8000456c:	00001097          	auipc	ra,0x1
    80004570:	a9c080e7          	jalr	-1380(ra) # 80005008 <__printf>
    80004574:	00003517          	auipc	a0,0x3
    80004578:	cfc50513          	addi	a0,a0,-772 # 80007270 <CONSOLE_STATUS+0x260>
    8000457c:	00001097          	auipc	ra,0x1
    80004580:	a8c080e7          	jalr	-1396(ra) # 80005008 <__printf>
    80004584:	00001097          	auipc	ra,0x1
    80004588:	4a4080e7          	jalr	1188(ra) # 80005a28 <kinit>
    8000458c:	00000097          	auipc	ra,0x0
    80004590:	148080e7          	jalr	328(ra) # 800046d4 <trapinit>
    80004594:	00000097          	auipc	ra,0x0
    80004598:	16c080e7          	jalr	364(ra) # 80004700 <trapinithart>
    8000459c:	00000097          	auipc	ra,0x0
    800045a0:	5b4080e7          	jalr	1460(ra) # 80004b50 <plicinit>
    800045a4:	00000097          	auipc	ra,0x0
    800045a8:	5d4080e7          	jalr	1492(ra) # 80004b78 <plicinithart>
    800045ac:	00000097          	auipc	ra,0x0
    800045b0:	078080e7          	jalr	120(ra) # 80004624 <userinit>
    800045b4:	0ff0000f          	fence
    800045b8:	00100793          	li	a5,1
    800045bc:	00003517          	auipc	a0,0x3
    800045c0:	bbc50513          	addi	a0,a0,-1092 # 80007178 <CONSOLE_STATUS+0x168>
    800045c4:	00f4a023          	sw	a5,0(s1)
    800045c8:	00001097          	auipc	ra,0x1
    800045cc:	a40080e7          	jalr	-1472(ra) # 80005008 <__printf>
    800045d0:	0000006f          	j	800045d0 <system_main+0xd4>

00000000800045d4 <cpuid>:
    800045d4:	ff010113          	addi	sp,sp,-16
    800045d8:	00813423          	sd	s0,8(sp)
    800045dc:	01010413          	addi	s0,sp,16
    800045e0:	00020513          	mv	a0,tp
    800045e4:	00813403          	ld	s0,8(sp)
    800045e8:	0005051b          	sext.w	a0,a0
    800045ec:	01010113          	addi	sp,sp,16
    800045f0:	00008067          	ret

00000000800045f4 <mycpu>:
    800045f4:	ff010113          	addi	sp,sp,-16
    800045f8:	00813423          	sd	s0,8(sp)
    800045fc:	01010413          	addi	s0,sp,16
    80004600:	00020793          	mv	a5,tp
    80004604:	00813403          	ld	s0,8(sp)
    80004608:	0007879b          	sext.w	a5,a5
    8000460c:	00779793          	slli	a5,a5,0x7
    80004610:	00005517          	auipc	a0,0x5
    80004614:	44050513          	addi	a0,a0,1088 # 80009a50 <cpus>
    80004618:	00f50533          	add	a0,a0,a5
    8000461c:	01010113          	addi	sp,sp,16
    80004620:	00008067          	ret

0000000080004624 <userinit>:
    80004624:	ff010113          	addi	sp,sp,-16
    80004628:	00813423          	sd	s0,8(sp)
    8000462c:	01010413          	addi	s0,sp,16
    80004630:	00813403          	ld	s0,8(sp)
    80004634:	01010113          	addi	sp,sp,16
    80004638:	ffffe317          	auipc	t1,0xffffe
    8000463c:	90430067          	jr	-1788(t1) # 80001f3c <main>

0000000080004640 <either_copyout>:
    80004640:	ff010113          	addi	sp,sp,-16
    80004644:	00813023          	sd	s0,0(sp)
    80004648:	00113423          	sd	ra,8(sp)
    8000464c:	01010413          	addi	s0,sp,16
    80004650:	02051663          	bnez	a0,8000467c <either_copyout+0x3c>
    80004654:	00058513          	mv	a0,a1
    80004658:	00060593          	mv	a1,a2
    8000465c:	0006861b          	sext.w	a2,a3
    80004660:	00002097          	auipc	ra,0x2
    80004664:	c54080e7          	jalr	-940(ra) # 800062b4 <__memmove>
    80004668:	00813083          	ld	ra,8(sp)
    8000466c:	00013403          	ld	s0,0(sp)
    80004670:	00000513          	li	a0,0
    80004674:	01010113          	addi	sp,sp,16
    80004678:	00008067          	ret
    8000467c:	00003517          	auipc	a0,0x3
    80004680:	b3c50513          	addi	a0,a0,-1220 # 800071b8 <CONSOLE_STATUS+0x1a8>
    80004684:	00001097          	auipc	ra,0x1
    80004688:	928080e7          	jalr	-1752(ra) # 80004fac <panic>

000000008000468c <either_copyin>:
    8000468c:	ff010113          	addi	sp,sp,-16
    80004690:	00813023          	sd	s0,0(sp)
    80004694:	00113423          	sd	ra,8(sp)
    80004698:	01010413          	addi	s0,sp,16
    8000469c:	02059463          	bnez	a1,800046c4 <either_copyin+0x38>
    800046a0:	00060593          	mv	a1,a2
    800046a4:	0006861b          	sext.w	a2,a3
    800046a8:	00002097          	auipc	ra,0x2
    800046ac:	c0c080e7          	jalr	-1012(ra) # 800062b4 <__memmove>
    800046b0:	00813083          	ld	ra,8(sp)
    800046b4:	00013403          	ld	s0,0(sp)
    800046b8:	00000513          	li	a0,0
    800046bc:	01010113          	addi	sp,sp,16
    800046c0:	00008067          	ret
    800046c4:	00003517          	auipc	a0,0x3
    800046c8:	b1c50513          	addi	a0,a0,-1252 # 800071e0 <CONSOLE_STATUS+0x1d0>
    800046cc:	00001097          	auipc	ra,0x1
    800046d0:	8e0080e7          	jalr	-1824(ra) # 80004fac <panic>

00000000800046d4 <trapinit>:
    800046d4:	ff010113          	addi	sp,sp,-16
    800046d8:	00813423          	sd	s0,8(sp)
    800046dc:	01010413          	addi	s0,sp,16
    800046e0:	00813403          	ld	s0,8(sp)
    800046e4:	00003597          	auipc	a1,0x3
    800046e8:	b2458593          	addi	a1,a1,-1244 # 80007208 <CONSOLE_STATUS+0x1f8>
    800046ec:	00005517          	auipc	a0,0x5
    800046f0:	3e450513          	addi	a0,a0,996 # 80009ad0 <tickslock>
    800046f4:	01010113          	addi	sp,sp,16
    800046f8:	00001317          	auipc	t1,0x1
    800046fc:	5c030067          	jr	1472(t1) # 80005cb8 <initlock>

0000000080004700 <trapinithart>:
    80004700:	ff010113          	addi	sp,sp,-16
    80004704:	00813423          	sd	s0,8(sp)
    80004708:	01010413          	addi	s0,sp,16
    8000470c:	00000797          	auipc	a5,0x0
    80004710:	2f478793          	addi	a5,a5,756 # 80004a00 <kernelvec>
    80004714:	10579073          	csrw	stvec,a5
    80004718:	00813403          	ld	s0,8(sp)
    8000471c:	01010113          	addi	sp,sp,16
    80004720:	00008067          	ret

0000000080004724 <usertrap>:
    80004724:	ff010113          	addi	sp,sp,-16
    80004728:	00813423          	sd	s0,8(sp)
    8000472c:	01010413          	addi	s0,sp,16
    80004730:	00813403          	ld	s0,8(sp)
    80004734:	01010113          	addi	sp,sp,16
    80004738:	00008067          	ret

000000008000473c <usertrapret>:
    8000473c:	ff010113          	addi	sp,sp,-16
    80004740:	00813423          	sd	s0,8(sp)
    80004744:	01010413          	addi	s0,sp,16
    80004748:	00813403          	ld	s0,8(sp)
    8000474c:	01010113          	addi	sp,sp,16
    80004750:	00008067          	ret

0000000080004754 <kerneltrap>:
    80004754:	fe010113          	addi	sp,sp,-32
    80004758:	00813823          	sd	s0,16(sp)
    8000475c:	00113c23          	sd	ra,24(sp)
    80004760:	00913423          	sd	s1,8(sp)
    80004764:	02010413          	addi	s0,sp,32
    80004768:	142025f3          	csrr	a1,scause
    8000476c:	100027f3          	csrr	a5,sstatus
    80004770:	0027f793          	andi	a5,a5,2
    80004774:	10079c63          	bnez	a5,8000488c <kerneltrap+0x138>
    80004778:	142027f3          	csrr	a5,scause
    8000477c:	0207ce63          	bltz	a5,800047b8 <kerneltrap+0x64>
    80004780:	00003517          	auipc	a0,0x3
    80004784:	ad050513          	addi	a0,a0,-1328 # 80007250 <CONSOLE_STATUS+0x240>
    80004788:	00001097          	auipc	ra,0x1
    8000478c:	880080e7          	jalr	-1920(ra) # 80005008 <__printf>
    80004790:	141025f3          	csrr	a1,sepc
    80004794:	14302673          	csrr	a2,stval
    80004798:	00003517          	auipc	a0,0x3
    8000479c:	ac850513          	addi	a0,a0,-1336 # 80007260 <CONSOLE_STATUS+0x250>
    800047a0:	00001097          	auipc	ra,0x1
    800047a4:	868080e7          	jalr	-1944(ra) # 80005008 <__printf>
    800047a8:	00003517          	auipc	a0,0x3
    800047ac:	ad050513          	addi	a0,a0,-1328 # 80007278 <CONSOLE_STATUS+0x268>
    800047b0:	00000097          	auipc	ra,0x0
    800047b4:	7fc080e7          	jalr	2044(ra) # 80004fac <panic>
    800047b8:	0ff7f713          	andi	a4,a5,255
    800047bc:	00900693          	li	a3,9
    800047c0:	04d70063          	beq	a4,a3,80004800 <kerneltrap+0xac>
    800047c4:	fff00713          	li	a4,-1
    800047c8:	03f71713          	slli	a4,a4,0x3f
    800047cc:	00170713          	addi	a4,a4,1
    800047d0:	fae798e3          	bne	a5,a4,80004780 <kerneltrap+0x2c>
    800047d4:	00000097          	auipc	ra,0x0
    800047d8:	e00080e7          	jalr	-512(ra) # 800045d4 <cpuid>
    800047dc:	06050663          	beqz	a0,80004848 <kerneltrap+0xf4>
    800047e0:	144027f3          	csrr	a5,sip
    800047e4:	ffd7f793          	andi	a5,a5,-3
    800047e8:	14479073          	csrw	sip,a5
    800047ec:	01813083          	ld	ra,24(sp)
    800047f0:	01013403          	ld	s0,16(sp)
    800047f4:	00813483          	ld	s1,8(sp)
    800047f8:	02010113          	addi	sp,sp,32
    800047fc:	00008067          	ret
    80004800:	00000097          	auipc	ra,0x0
    80004804:	3c4080e7          	jalr	964(ra) # 80004bc4 <plic_claim>
    80004808:	00a00793          	li	a5,10
    8000480c:	00050493          	mv	s1,a0
    80004810:	06f50863          	beq	a0,a5,80004880 <kerneltrap+0x12c>
    80004814:	fc050ce3          	beqz	a0,800047ec <kerneltrap+0x98>
    80004818:	00050593          	mv	a1,a0
    8000481c:	00003517          	auipc	a0,0x3
    80004820:	a1450513          	addi	a0,a0,-1516 # 80007230 <CONSOLE_STATUS+0x220>
    80004824:	00000097          	auipc	ra,0x0
    80004828:	7e4080e7          	jalr	2020(ra) # 80005008 <__printf>
    8000482c:	01013403          	ld	s0,16(sp)
    80004830:	01813083          	ld	ra,24(sp)
    80004834:	00048513          	mv	a0,s1
    80004838:	00813483          	ld	s1,8(sp)
    8000483c:	02010113          	addi	sp,sp,32
    80004840:	00000317          	auipc	t1,0x0
    80004844:	3bc30067          	jr	956(t1) # 80004bfc <plic_complete>
    80004848:	00005517          	auipc	a0,0x5
    8000484c:	28850513          	addi	a0,a0,648 # 80009ad0 <tickslock>
    80004850:	00001097          	auipc	ra,0x1
    80004854:	48c080e7          	jalr	1164(ra) # 80005cdc <acquire>
    80004858:	00004717          	auipc	a4,0x4
    8000485c:	14c70713          	addi	a4,a4,332 # 800089a4 <ticks>
    80004860:	00072783          	lw	a5,0(a4)
    80004864:	00005517          	auipc	a0,0x5
    80004868:	26c50513          	addi	a0,a0,620 # 80009ad0 <tickslock>
    8000486c:	0017879b          	addiw	a5,a5,1
    80004870:	00f72023          	sw	a5,0(a4)
    80004874:	00001097          	auipc	ra,0x1
    80004878:	534080e7          	jalr	1332(ra) # 80005da8 <release>
    8000487c:	f65ff06f          	j	800047e0 <kerneltrap+0x8c>
    80004880:	00001097          	auipc	ra,0x1
    80004884:	090080e7          	jalr	144(ra) # 80005910 <uartintr>
    80004888:	fa5ff06f          	j	8000482c <kerneltrap+0xd8>
    8000488c:	00003517          	auipc	a0,0x3
    80004890:	98450513          	addi	a0,a0,-1660 # 80007210 <CONSOLE_STATUS+0x200>
    80004894:	00000097          	auipc	ra,0x0
    80004898:	718080e7          	jalr	1816(ra) # 80004fac <panic>

000000008000489c <clockintr>:
    8000489c:	fe010113          	addi	sp,sp,-32
    800048a0:	00813823          	sd	s0,16(sp)
    800048a4:	00913423          	sd	s1,8(sp)
    800048a8:	00113c23          	sd	ra,24(sp)
    800048ac:	02010413          	addi	s0,sp,32
    800048b0:	00005497          	auipc	s1,0x5
    800048b4:	22048493          	addi	s1,s1,544 # 80009ad0 <tickslock>
    800048b8:	00048513          	mv	a0,s1
    800048bc:	00001097          	auipc	ra,0x1
    800048c0:	420080e7          	jalr	1056(ra) # 80005cdc <acquire>
    800048c4:	00004717          	auipc	a4,0x4
    800048c8:	0e070713          	addi	a4,a4,224 # 800089a4 <ticks>
    800048cc:	00072783          	lw	a5,0(a4)
    800048d0:	01013403          	ld	s0,16(sp)
    800048d4:	01813083          	ld	ra,24(sp)
    800048d8:	00048513          	mv	a0,s1
    800048dc:	0017879b          	addiw	a5,a5,1
    800048e0:	00813483          	ld	s1,8(sp)
    800048e4:	00f72023          	sw	a5,0(a4)
    800048e8:	02010113          	addi	sp,sp,32
    800048ec:	00001317          	auipc	t1,0x1
    800048f0:	4bc30067          	jr	1212(t1) # 80005da8 <release>

00000000800048f4 <devintr>:
    800048f4:	142027f3          	csrr	a5,scause
    800048f8:	00000513          	li	a0,0
    800048fc:	0007c463          	bltz	a5,80004904 <devintr+0x10>
    80004900:	00008067          	ret
    80004904:	fe010113          	addi	sp,sp,-32
    80004908:	00813823          	sd	s0,16(sp)
    8000490c:	00113c23          	sd	ra,24(sp)
    80004910:	00913423          	sd	s1,8(sp)
    80004914:	02010413          	addi	s0,sp,32
    80004918:	0ff7f713          	andi	a4,a5,255
    8000491c:	00900693          	li	a3,9
    80004920:	04d70c63          	beq	a4,a3,80004978 <devintr+0x84>
    80004924:	fff00713          	li	a4,-1
    80004928:	03f71713          	slli	a4,a4,0x3f
    8000492c:	00170713          	addi	a4,a4,1
    80004930:	00e78c63          	beq	a5,a4,80004948 <devintr+0x54>
    80004934:	01813083          	ld	ra,24(sp)
    80004938:	01013403          	ld	s0,16(sp)
    8000493c:	00813483          	ld	s1,8(sp)
    80004940:	02010113          	addi	sp,sp,32
    80004944:	00008067          	ret
    80004948:	00000097          	auipc	ra,0x0
    8000494c:	c8c080e7          	jalr	-884(ra) # 800045d4 <cpuid>
    80004950:	06050663          	beqz	a0,800049bc <devintr+0xc8>
    80004954:	144027f3          	csrr	a5,sip
    80004958:	ffd7f793          	andi	a5,a5,-3
    8000495c:	14479073          	csrw	sip,a5
    80004960:	01813083          	ld	ra,24(sp)
    80004964:	01013403          	ld	s0,16(sp)
    80004968:	00813483          	ld	s1,8(sp)
    8000496c:	00200513          	li	a0,2
    80004970:	02010113          	addi	sp,sp,32
    80004974:	00008067          	ret
    80004978:	00000097          	auipc	ra,0x0
    8000497c:	24c080e7          	jalr	588(ra) # 80004bc4 <plic_claim>
    80004980:	00a00793          	li	a5,10
    80004984:	00050493          	mv	s1,a0
    80004988:	06f50663          	beq	a0,a5,800049f4 <devintr+0x100>
    8000498c:	00100513          	li	a0,1
    80004990:	fa0482e3          	beqz	s1,80004934 <devintr+0x40>
    80004994:	00048593          	mv	a1,s1
    80004998:	00003517          	auipc	a0,0x3
    8000499c:	89850513          	addi	a0,a0,-1896 # 80007230 <CONSOLE_STATUS+0x220>
    800049a0:	00000097          	auipc	ra,0x0
    800049a4:	668080e7          	jalr	1640(ra) # 80005008 <__printf>
    800049a8:	00048513          	mv	a0,s1
    800049ac:	00000097          	auipc	ra,0x0
    800049b0:	250080e7          	jalr	592(ra) # 80004bfc <plic_complete>
    800049b4:	00100513          	li	a0,1
    800049b8:	f7dff06f          	j	80004934 <devintr+0x40>
    800049bc:	00005517          	auipc	a0,0x5
    800049c0:	11450513          	addi	a0,a0,276 # 80009ad0 <tickslock>
    800049c4:	00001097          	auipc	ra,0x1
    800049c8:	318080e7          	jalr	792(ra) # 80005cdc <acquire>
    800049cc:	00004717          	auipc	a4,0x4
    800049d0:	fd870713          	addi	a4,a4,-40 # 800089a4 <ticks>
    800049d4:	00072783          	lw	a5,0(a4)
    800049d8:	00005517          	auipc	a0,0x5
    800049dc:	0f850513          	addi	a0,a0,248 # 80009ad0 <tickslock>
    800049e0:	0017879b          	addiw	a5,a5,1
    800049e4:	00f72023          	sw	a5,0(a4)
    800049e8:	00001097          	auipc	ra,0x1
    800049ec:	3c0080e7          	jalr	960(ra) # 80005da8 <release>
    800049f0:	f65ff06f          	j	80004954 <devintr+0x60>
    800049f4:	00001097          	auipc	ra,0x1
    800049f8:	f1c080e7          	jalr	-228(ra) # 80005910 <uartintr>
    800049fc:	fadff06f          	j	800049a8 <devintr+0xb4>

0000000080004a00 <kernelvec>:
    80004a00:	f0010113          	addi	sp,sp,-256
    80004a04:	00113023          	sd	ra,0(sp)
    80004a08:	00213423          	sd	sp,8(sp)
    80004a0c:	00313823          	sd	gp,16(sp)
    80004a10:	00413c23          	sd	tp,24(sp)
    80004a14:	02513023          	sd	t0,32(sp)
    80004a18:	02613423          	sd	t1,40(sp)
    80004a1c:	02713823          	sd	t2,48(sp)
    80004a20:	02813c23          	sd	s0,56(sp)
    80004a24:	04913023          	sd	s1,64(sp)
    80004a28:	04a13423          	sd	a0,72(sp)
    80004a2c:	04b13823          	sd	a1,80(sp)
    80004a30:	04c13c23          	sd	a2,88(sp)
    80004a34:	06d13023          	sd	a3,96(sp)
    80004a38:	06e13423          	sd	a4,104(sp)
    80004a3c:	06f13823          	sd	a5,112(sp)
    80004a40:	07013c23          	sd	a6,120(sp)
    80004a44:	09113023          	sd	a7,128(sp)
    80004a48:	09213423          	sd	s2,136(sp)
    80004a4c:	09313823          	sd	s3,144(sp)
    80004a50:	09413c23          	sd	s4,152(sp)
    80004a54:	0b513023          	sd	s5,160(sp)
    80004a58:	0b613423          	sd	s6,168(sp)
    80004a5c:	0b713823          	sd	s7,176(sp)
    80004a60:	0b813c23          	sd	s8,184(sp)
    80004a64:	0d913023          	sd	s9,192(sp)
    80004a68:	0da13423          	sd	s10,200(sp)
    80004a6c:	0db13823          	sd	s11,208(sp)
    80004a70:	0dc13c23          	sd	t3,216(sp)
    80004a74:	0fd13023          	sd	t4,224(sp)
    80004a78:	0fe13423          	sd	t5,232(sp)
    80004a7c:	0ff13823          	sd	t6,240(sp)
    80004a80:	cd5ff0ef          	jal	ra,80004754 <kerneltrap>
    80004a84:	00013083          	ld	ra,0(sp)
    80004a88:	00813103          	ld	sp,8(sp)
    80004a8c:	01013183          	ld	gp,16(sp)
    80004a90:	02013283          	ld	t0,32(sp)
    80004a94:	02813303          	ld	t1,40(sp)
    80004a98:	03013383          	ld	t2,48(sp)
    80004a9c:	03813403          	ld	s0,56(sp)
    80004aa0:	04013483          	ld	s1,64(sp)
    80004aa4:	04813503          	ld	a0,72(sp)
    80004aa8:	05013583          	ld	a1,80(sp)
    80004aac:	05813603          	ld	a2,88(sp)
    80004ab0:	06013683          	ld	a3,96(sp)
    80004ab4:	06813703          	ld	a4,104(sp)
    80004ab8:	07013783          	ld	a5,112(sp)
    80004abc:	07813803          	ld	a6,120(sp)
    80004ac0:	08013883          	ld	a7,128(sp)
    80004ac4:	08813903          	ld	s2,136(sp)
    80004ac8:	09013983          	ld	s3,144(sp)
    80004acc:	09813a03          	ld	s4,152(sp)
    80004ad0:	0a013a83          	ld	s5,160(sp)
    80004ad4:	0a813b03          	ld	s6,168(sp)
    80004ad8:	0b013b83          	ld	s7,176(sp)
    80004adc:	0b813c03          	ld	s8,184(sp)
    80004ae0:	0c013c83          	ld	s9,192(sp)
    80004ae4:	0c813d03          	ld	s10,200(sp)
    80004ae8:	0d013d83          	ld	s11,208(sp)
    80004aec:	0d813e03          	ld	t3,216(sp)
    80004af0:	0e013e83          	ld	t4,224(sp)
    80004af4:	0e813f03          	ld	t5,232(sp)
    80004af8:	0f013f83          	ld	t6,240(sp)
    80004afc:	10010113          	addi	sp,sp,256
    80004b00:	10200073          	sret
    80004b04:	00000013          	nop
    80004b08:	00000013          	nop
    80004b0c:	00000013          	nop

0000000080004b10 <timervec>:
    80004b10:	34051573          	csrrw	a0,mscratch,a0
    80004b14:	00b53023          	sd	a1,0(a0)
    80004b18:	00c53423          	sd	a2,8(a0)
    80004b1c:	00d53823          	sd	a3,16(a0)
    80004b20:	01853583          	ld	a1,24(a0)
    80004b24:	02053603          	ld	a2,32(a0)
    80004b28:	0005b683          	ld	a3,0(a1)
    80004b2c:	00c686b3          	add	a3,a3,a2
    80004b30:	00d5b023          	sd	a3,0(a1)
    80004b34:	00200593          	li	a1,2
    80004b38:	14459073          	csrw	sip,a1
    80004b3c:	01053683          	ld	a3,16(a0)
    80004b40:	00853603          	ld	a2,8(a0)
    80004b44:	00053583          	ld	a1,0(a0)
    80004b48:	34051573          	csrrw	a0,mscratch,a0
    80004b4c:	30200073          	mret

0000000080004b50 <plicinit>:
    80004b50:	ff010113          	addi	sp,sp,-16
    80004b54:	00813423          	sd	s0,8(sp)
    80004b58:	01010413          	addi	s0,sp,16
    80004b5c:	00813403          	ld	s0,8(sp)
    80004b60:	0c0007b7          	lui	a5,0xc000
    80004b64:	00100713          	li	a4,1
    80004b68:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80004b6c:	00e7a223          	sw	a4,4(a5)
    80004b70:	01010113          	addi	sp,sp,16
    80004b74:	00008067          	ret

0000000080004b78 <plicinithart>:
    80004b78:	ff010113          	addi	sp,sp,-16
    80004b7c:	00813023          	sd	s0,0(sp)
    80004b80:	00113423          	sd	ra,8(sp)
    80004b84:	01010413          	addi	s0,sp,16
    80004b88:	00000097          	auipc	ra,0x0
    80004b8c:	a4c080e7          	jalr	-1460(ra) # 800045d4 <cpuid>
    80004b90:	0085171b          	slliw	a4,a0,0x8
    80004b94:	0c0027b7          	lui	a5,0xc002
    80004b98:	00e787b3          	add	a5,a5,a4
    80004b9c:	40200713          	li	a4,1026
    80004ba0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004ba4:	00813083          	ld	ra,8(sp)
    80004ba8:	00013403          	ld	s0,0(sp)
    80004bac:	00d5151b          	slliw	a0,a0,0xd
    80004bb0:	0c2017b7          	lui	a5,0xc201
    80004bb4:	00a78533          	add	a0,a5,a0
    80004bb8:	00052023          	sw	zero,0(a0)
    80004bbc:	01010113          	addi	sp,sp,16
    80004bc0:	00008067          	ret

0000000080004bc4 <plic_claim>:
    80004bc4:	ff010113          	addi	sp,sp,-16
    80004bc8:	00813023          	sd	s0,0(sp)
    80004bcc:	00113423          	sd	ra,8(sp)
    80004bd0:	01010413          	addi	s0,sp,16
    80004bd4:	00000097          	auipc	ra,0x0
    80004bd8:	a00080e7          	jalr	-1536(ra) # 800045d4 <cpuid>
    80004bdc:	00813083          	ld	ra,8(sp)
    80004be0:	00013403          	ld	s0,0(sp)
    80004be4:	00d5151b          	slliw	a0,a0,0xd
    80004be8:	0c2017b7          	lui	a5,0xc201
    80004bec:	00a78533          	add	a0,a5,a0
    80004bf0:	00452503          	lw	a0,4(a0)
    80004bf4:	01010113          	addi	sp,sp,16
    80004bf8:	00008067          	ret

0000000080004bfc <plic_complete>:
    80004bfc:	fe010113          	addi	sp,sp,-32
    80004c00:	00813823          	sd	s0,16(sp)
    80004c04:	00913423          	sd	s1,8(sp)
    80004c08:	00113c23          	sd	ra,24(sp)
    80004c0c:	02010413          	addi	s0,sp,32
    80004c10:	00050493          	mv	s1,a0
    80004c14:	00000097          	auipc	ra,0x0
    80004c18:	9c0080e7          	jalr	-1600(ra) # 800045d4 <cpuid>
    80004c1c:	01813083          	ld	ra,24(sp)
    80004c20:	01013403          	ld	s0,16(sp)
    80004c24:	00d5179b          	slliw	a5,a0,0xd
    80004c28:	0c201737          	lui	a4,0xc201
    80004c2c:	00f707b3          	add	a5,a4,a5
    80004c30:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004c34:	00813483          	ld	s1,8(sp)
    80004c38:	02010113          	addi	sp,sp,32
    80004c3c:	00008067          	ret

0000000080004c40 <consolewrite>:
    80004c40:	fb010113          	addi	sp,sp,-80
    80004c44:	04813023          	sd	s0,64(sp)
    80004c48:	04113423          	sd	ra,72(sp)
    80004c4c:	02913c23          	sd	s1,56(sp)
    80004c50:	03213823          	sd	s2,48(sp)
    80004c54:	03313423          	sd	s3,40(sp)
    80004c58:	03413023          	sd	s4,32(sp)
    80004c5c:	01513c23          	sd	s5,24(sp)
    80004c60:	05010413          	addi	s0,sp,80
    80004c64:	06c05c63          	blez	a2,80004cdc <consolewrite+0x9c>
    80004c68:	00060993          	mv	s3,a2
    80004c6c:	00050a13          	mv	s4,a0
    80004c70:	00058493          	mv	s1,a1
    80004c74:	00000913          	li	s2,0
    80004c78:	fff00a93          	li	s5,-1
    80004c7c:	01c0006f          	j	80004c98 <consolewrite+0x58>
    80004c80:	fbf44503          	lbu	a0,-65(s0)
    80004c84:	0019091b          	addiw	s2,s2,1
    80004c88:	00148493          	addi	s1,s1,1
    80004c8c:	00001097          	auipc	ra,0x1
    80004c90:	a9c080e7          	jalr	-1380(ra) # 80005728 <uartputc>
    80004c94:	03298063          	beq	s3,s2,80004cb4 <consolewrite+0x74>
    80004c98:	00048613          	mv	a2,s1
    80004c9c:	00100693          	li	a3,1
    80004ca0:	000a0593          	mv	a1,s4
    80004ca4:	fbf40513          	addi	a0,s0,-65
    80004ca8:	00000097          	auipc	ra,0x0
    80004cac:	9e4080e7          	jalr	-1564(ra) # 8000468c <either_copyin>
    80004cb0:	fd5518e3          	bne	a0,s5,80004c80 <consolewrite+0x40>
    80004cb4:	04813083          	ld	ra,72(sp)
    80004cb8:	04013403          	ld	s0,64(sp)
    80004cbc:	03813483          	ld	s1,56(sp)
    80004cc0:	02813983          	ld	s3,40(sp)
    80004cc4:	02013a03          	ld	s4,32(sp)
    80004cc8:	01813a83          	ld	s5,24(sp)
    80004ccc:	00090513          	mv	a0,s2
    80004cd0:	03013903          	ld	s2,48(sp)
    80004cd4:	05010113          	addi	sp,sp,80
    80004cd8:	00008067          	ret
    80004cdc:	00000913          	li	s2,0
    80004ce0:	fd5ff06f          	j	80004cb4 <consolewrite+0x74>

0000000080004ce4 <consoleread>:
    80004ce4:	f9010113          	addi	sp,sp,-112
    80004ce8:	06813023          	sd	s0,96(sp)
    80004cec:	04913c23          	sd	s1,88(sp)
    80004cf0:	05213823          	sd	s2,80(sp)
    80004cf4:	05313423          	sd	s3,72(sp)
    80004cf8:	05413023          	sd	s4,64(sp)
    80004cfc:	03513c23          	sd	s5,56(sp)
    80004d00:	03613823          	sd	s6,48(sp)
    80004d04:	03713423          	sd	s7,40(sp)
    80004d08:	03813023          	sd	s8,32(sp)
    80004d0c:	06113423          	sd	ra,104(sp)
    80004d10:	01913c23          	sd	s9,24(sp)
    80004d14:	07010413          	addi	s0,sp,112
    80004d18:	00060b93          	mv	s7,a2
    80004d1c:	00050913          	mv	s2,a0
    80004d20:	00058c13          	mv	s8,a1
    80004d24:	00060b1b          	sext.w	s6,a2
    80004d28:	00005497          	auipc	s1,0x5
    80004d2c:	dd048493          	addi	s1,s1,-560 # 80009af8 <cons>
    80004d30:	00400993          	li	s3,4
    80004d34:	fff00a13          	li	s4,-1
    80004d38:	00a00a93          	li	s5,10
    80004d3c:	05705e63          	blez	s7,80004d98 <consoleread+0xb4>
    80004d40:	09c4a703          	lw	a4,156(s1)
    80004d44:	0984a783          	lw	a5,152(s1)
    80004d48:	0007071b          	sext.w	a4,a4
    80004d4c:	08e78463          	beq	a5,a4,80004dd4 <consoleread+0xf0>
    80004d50:	07f7f713          	andi	a4,a5,127
    80004d54:	00e48733          	add	a4,s1,a4
    80004d58:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80004d5c:	0017869b          	addiw	a3,a5,1
    80004d60:	08d4ac23          	sw	a3,152(s1)
    80004d64:	00070c9b          	sext.w	s9,a4
    80004d68:	0b370663          	beq	a4,s3,80004e14 <consoleread+0x130>
    80004d6c:	00100693          	li	a3,1
    80004d70:	f9f40613          	addi	a2,s0,-97
    80004d74:	000c0593          	mv	a1,s8
    80004d78:	00090513          	mv	a0,s2
    80004d7c:	f8e40fa3          	sb	a4,-97(s0)
    80004d80:	00000097          	auipc	ra,0x0
    80004d84:	8c0080e7          	jalr	-1856(ra) # 80004640 <either_copyout>
    80004d88:	01450863          	beq	a0,s4,80004d98 <consoleread+0xb4>
    80004d8c:	001c0c13          	addi	s8,s8,1
    80004d90:	fffb8b9b          	addiw	s7,s7,-1
    80004d94:	fb5c94e3          	bne	s9,s5,80004d3c <consoleread+0x58>
    80004d98:	000b851b          	sext.w	a0,s7
    80004d9c:	06813083          	ld	ra,104(sp)
    80004da0:	06013403          	ld	s0,96(sp)
    80004da4:	05813483          	ld	s1,88(sp)
    80004da8:	05013903          	ld	s2,80(sp)
    80004dac:	04813983          	ld	s3,72(sp)
    80004db0:	04013a03          	ld	s4,64(sp)
    80004db4:	03813a83          	ld	s5,56(sp)
    80004db8:	02813b83          	ld	s7,40(sp)
    80004dbc:	02013c03          	ld	s8,32(sp)
    80004dc0:	01813c83          	ld	s9,24(sp)
    80004dc4:	40ab053b          	subw	a0,s6,a0
    80004dc8:	03013b03          	ld	s6,48(sp)
    80004dcc:	07010113          	addi	sp,sp,112
    80004dd0:	00008067          	ret
    80004dd4:	00001097          	auipc	ra,0x1
    80004dd8:	1d8080e7          	jalr	472(ra) # 80005fac <push_on>
    80004ddc:	0984a703          	lw	a4,152(s1)
    80004de0:	09c4a783          	lw	a5,156(s1)
    80004de4:	0007879b          	sext.w	a5,a5
    80004de8:	fef70ce3          	beq	a4,a5,80004de0 <consoleread+0xfc>
    80004dec:	00001097          	auipc	ra,0x1
    80004df0:	234080e7          	jalr	564(ra) # 80006020 <pop_on>
    80004df4:	0984a783          	lw	a5,152(s1)
    80004df8:	07f7f713          	andi	a4,a5,127
    80004dfc:	00e48733          	add	a4,s1,a4
    80004e00:	01874703          	lbu	a4,24(a4)
    80004e04:	0017869b          	addiw	a3,a5,1
    80004e08:	08d4ac23          	sw	a3,152(s1)
    80004e0c:	00070c9b          	sext.w	s9,a4
    80004e10:	f5371ee3          	bne	a4,s3,80004d6c <consoleread+0x88>
    80004e14:	000b851b          	sext.w	a0,s7
    80004e18:	f96bf2e3          	bgeu	s7,s6,80004d9c <consoleread+0xb8>
    80004e1c:	08f4ac23          	sw	a5,152(s1)
    80004e20:	f7dff06f          	j	80004d9c <consoleread+0xb8>

0000000080004e24 <consputc>:
    80004e24:	10000793          	li	a5,256
    80004e28:	00f50663          	beq	a0,a5,80004e34 <consputc+0x10>
    80004e2c:	00001317          	auipc	t1,0x1
    80004e30:	9f430067          	jr	-1548(t1) # 80005820 <uartputc_sync>
    80004e34:	ff010113          	addi	sp,sp,-16
    80004e38:	00113423          	sd	ra,8(sp)
    80004e3c:	00813023          	sd	s0,0(sp)
    80004e40:	01010413          	addi	s0,sp,16
    80004e44:	00800513          	li	a0,8
    80004e48:	00001097          	auipc	ra,0x1
    80004e4c:	9d8080e7          	jalr	-1576(ra) # 80005820 <uartputc_sync>
    80004e50:	02000513          	li	a0,32
    80004e54:	00001097          	auipc	ra,0x1
    80004e58:	9cc080e7          	jalr	-1588(ra) # 80005820 <uartputc_sync>
    80004e5c:	00013403          	ld	s0,0(sp)
    80004e60:	00813083          	ld	ra,8(sp)
    80004e64:	00800513          	li	a0,8
    80004e68:	01010113          	addi	sp,sp,16
    80004e6c:	00001317          	auipc	t1,0x1
    80004e70:	9b430067          	jr	-1612(t1) # 80005820 <uartputc_sync>

0000000080004e74 <consoleintr>:
    80004e74:	fe010113          	addi	sp,sp,-32
    80004e78:	00813823          	sd	s0,16(sp)
    80004e7c:	00913423          	sd	s1,8(sp)
    80004e80:	01213023          	sd	s2,0(sp)
    80004e84:	00113c23          	sd	ra,24(sp)
    80004e88:	02010413          	addi	s0,sp,32
    80004e8c:	00005917          	auipc	s2,0x5
    80004e90:	c6c90913          	addi	s2,s2,-916 # 80009af8 <cons>
    80004e94:	00050493          	mv	s1,a0
    80004e98:	00090513          	mv	a0,s2
    80004e9c:	00001097          	auipc	ra,0x1
    80004ea0:	e40080e7          	jalr	-448(ra) # 80005cdc <acquire>
    80004ea4:	02048c63          	beqz	s1,80004edc <consoleintr+0x68>
    80004ea8:	0a092783          	lw	a5,160(s2)
    80004eac:	09892703          	lw	a4,152(s2)
    80004eb0:	07f00693          	li	a3,127
    80004eb4:	40e7873b          	subw	a4,a5,a4
    80004eb8:	02e6e263          	bltu	a3,a4,80004edc <consoleintr+0x68>
    80004ebc:	00d00713          	li	a4,13
    80004ec0:	04e48063          	beq	s1,a4,80004f00 <consoleintr+0x8c>
    80004ec4:	07f7f713          	andi	a4,a5,127
    80004ec8:	00e90733          	add	a4,s2,a4
    80004ecc:	0017879b          	addiw	a5,a5,1
    80004ed0:	0af92023          	sw	a5,160(s2)
    80004ed4:	00970c23          	sb	s1,24(a4)
    80004ed8:	08f92e23          	sw	a5,156(s2)
    80004edc:	01013403          	ld	s0,16(sp)
    80004ee0:	01813083          	ld	ra,24(sp)
    80004ee4:	00813483          	ld	s1,8(sp)
    80004ee8:	00013903          	ld	s2,0(sp)
    80004eec:	00005517          	auipc	a0,0x5
    80004ef0:	c0c50513          	addi	a0,a0,-1012 # 80009af8 <cons>
    80004ef4:	02010113          	addi	sp,sp,32
    80004ef8:	00001317          	auipc	t1,0x1
    80004efc:	eb030067          	jr	-336(t1) # 80005da8 <release>
    80004f00:	00a00493          	li	s1,10
    80004f04:	fc1ff06f          	j	80004ec4 <consoleintr+0x50>

0000000080004f08 <consoleinit>:
    80004f08:	fe010113          	addi	sp,sp,-32
    80004f0c:	00113c23          	sd	ra,24(sp)
    80004f10:	00813823          	sd	s0,16(sp)
    80004f14:	00913423          	sd	s1,8(sp)
    80004f18:	02010413          	addi	s0,sp,32
    80004f1c:	00005497          	auipc	s1,0x5
    80004f20:	bdc48493          	addi	s1,s1,-1060 # 80009af8 <cons>
    80004f24:	00048513          	mv	a0,s1
    80004f28:	00002597          	auipc	a1,0x2
    80004f2c:	36058593          	addi	a1,a1,864 # 80007288 <CONSOLE_STATUS+0x278>
    80004f30:	00001097          	auipc	ra,0x1
    80004f34:	d88080e7          	jalr	-632(ra) # 80005cb8 <initlock>
    80004f38:	00000097          	auipc	ra,0x0
    80004f3c:	7ac080e7          	jalr	1964(ra) # 800056e4 <uartinit>
    80004f40:	01813083          	ld	ra,24(sp)
    80004f44:	01013403          	ld	s0,16(sp)
    80004f48:	00000797          	auipc	a5,0x0
    80004f4c:	d9c78793          	addi	a5,a5,-612 # 80004ce4 <consoleread>
    80004f50:	0af4bc23          	sd	a5,184(s1)
    80004f54:	00000797          	auipc	a5,0x0
    80004f58:	cec78793          	addi	a5,a5,-788 # 80004c40 <consolewrite>
    80004f5c:	0cf4b023          	sd	a5,192(s1)
    80004f60:	00813483          	ld	s1,8(sp)
    80004f64:	02010113          	addi	sp,sp,32
    80004f68:	00008067          	ret

0000000080004f6c <console_read>:
    80004f6c:	ff010113          	addi	sp,sp,-16
    80004f70:	00813423          	sd	s0,8(sp)
    80004f74:	01010413          	addi	s0,sp,16
    80004f78:	00813403          	ld	s0,8(sp)
    80004f7c:	00005317          	auipc	t1,0x5
    80004f80:	c3433303          	ld	t1,-972(t1) # 80009bb0 <devsw+0x10>
    80004f84:	01010113          	addi	sp,sp,16
    80004f88:	00030067          	jr	t1

0000000080004f8c <console_write>:
    80004f8c:	ff010113          	addi	sp,sp,-16
    80004f90:	00813423          	sd	s0,8(sp)
    80004f94:	01010413          	addi	s0,sp,16
    80004f98:	00813403          	ld	s0,8(sp)
    80004f9c:	00005317          	auipc	t1,0x5
    80004fa0:	c1c33303          	ld	t1,-996(t1) # 80009bb8 <devsw+0x18>
    80004fa4:	01010113          	addi	sp,sp,16
    80004fa8:	00030067          	jr	t1

0000000080004fac <panic>:
    80004fac:	fe010113          	addi	sp,sp,-32
    80004fb0:	00113c23          	sd	ra,24(sp)
    80004fb4:	00813823          	sd	s0,16(sp)
    80004fb8:	00913423          	sd	s1,8(sp)
    80004fbc:	02010413          	addi	s0,sp,32
    80004fc0:	00050493          	mv	s1,a0
    80004fc4:	00002517          	auipc	a0,0x2
    80004fc8:	2cc50513          	addi	a0,a0,716 # 80007290 <CONSOLE_STATUS+0x280>
    80004fcc:	00005797          	auipc	a5,0x5
    80004fd0:	c807a623          	sw	zero,-884(a5) # 80009c58 <pr+0x18>
    80004fd4:	00000097          	auipc	ra,0x0
    80004fd8:	034080e7          	jalr	52(ra) # 80005008 <__printf>
    80004fdc:	00048513          	mv	a0,s1
    80004fe0:	00000097          	auipc	ra,0x0
    80004fe4:	028080e7          	jalr	40(ra) # 80005008 <__printf>
    80004fe8:	00002517          	auipc	a0,0x2
    80004fec:	28850513          	addi	a0,a0,648 # 80007270 <CONSOLE_STATUS+0x260>
    80004ff0:	00000097          	auipc	ra,0x0
    80004ff4:	018080e7          	jalr	24(ra) # 80005008 <__printf>
    80004ff8:	00100793          	li	a5,1
    80004ffc:	00004717          	auipc	a4,0x4
    80005000:	9af72623          	sw	a5,-1620(a4) # 800089a8 <panicked>
    80005004:	0000006f          	j	80005004 <panic+0x58>

0000000080005008 <__printf>:
    80005008:	f3010113          	addi	sp,sp,-208
    8000500c:	08813023          	sd	s0,128(sp)
    80005010:	07313423          	sd	s3,104(sp)
    80005014:	09010413          	addi	s0,sp,144
    80005018:	05813023          	sd	s8,64(sp)
    8000501c:	08113423          	sd	ra,136(sp)
    80005020:	06913c23          	sd	s1,120(sp)
    80005024:	07213823          	sd	s2,112(sp)
    80005028:	07413023          	sd	s4,96(sp)
    8000502c:	05513c23          	sd	s5,88(sp)
    80005030:	05613823          	sd	s6,80(sp)
    80005034:	05713423          	sd	s7,72(sp)
    80005038:	03913c23          	sd	s9,56(sp)
    8000503c:	03a13823          	sd	s10,48(sp)
    80005040:	03b13423          	sd	s11,40(sp)
    80005044:	00005317          	auipc	t1,0x5
    80005048:	bfc30313          	addi	t1,t1,-1028 # 80009c40 <pr>
    8000504c:	01832c03          	lw	s8,24(t1)
    80005050:	00b43423          	sd	a1,8(s0)
    80005054:	00c43823          	sd	a2,16(s0)
    80005058:	00d43c23          	sd	a3,24(s0)
    8000505c:	02e43023          	sd	a4,32(s0)
    80005060:	02f43423          	sd	a5,40(s0)
    80005064:	03043823          	sd	a6,48(s0)
    80005068:	03143c23          	sd	a7,56(s0)
    8000506c:	00050993          	mv	s3,a0
    80005070:	4a0c1663          	bnez	s8,8000551c <__printf+0x514>
    80005074:	60098c63          	beqz	s3,8000568c <__printf+0x684>
    80005078:	0009c503          	lbu	a0,0(s3)
    8000507c:	00840793          	addi	a5,s0,8
    80005080:	f6f43c23          	sd	a5,-136(s0)
    80005084:	00000493          	li	s1,0
    80005088:	22050063          	beqz	a0,800052a8 <__printf+0x2a0>
    8000508c:	00002a37          	lui	s4,0x2
    80005090:	00018ab7          	lui	s5,0x18
    80005094:	000f4b37          	lui	s6,0xf4
    80005098:	00989bb7          	lui	s7,0x989
    8000509c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800050a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800050a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800050a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800050ac:	00148c9b          	addiw	s9,s1,1
    800050b0:	02500793          	li	a5,37
    800050b4:	01998933          	add	s2,s3,s9
    800050b8:	38f51263          	bne	a0,a5,8000543c <__printf+0x434>
    800050bc:	00094783          	lbu	a5,0(s2)
    800050c0:	00078c9b          	sext.w	s9,a5
    800050c4:	1e078263          	beqz	a5,800052a8 <__printf+0x2a0>
    800050c8:	0024849b          	addiw	s1,s1,2
    800050cc:	07000713          	li	a4,112
    800050d0:	00998933          	add	s2,s3,s1
    800050d4:	38e78a63          	beq	a5,a4,80005468 <__printf+0x460>
    800050d8:	20f76863          	bltu	a4,a5,800052e8 <__printf+0x2e0>
    800050dc:	42a78863          	beq	a5,a0,8000550c <__printf+0x504>
    800050e0:	06400713          	li	a4,100
    800050e4:	40e79663          	bne	a5,a4,800054f0 <__printf+0x4e8>
    800050e8:	f7843783          	ld	a5,-136(s0)
    800050ec:	0007a603          	lw	a2,0(a5)
    800050f0:	00878793          	addi	a5,a5,8
    800050f4:	f6f43c23          	sd	a5,-136(s0)
    800050f8:	42064a63          	bltz	a2,8000552c <__printf+0x524>
    800050fc:	00a00713          	li	a4,10
    80005100:	02e677bb          	remuw	a5,a2,a4
    80005104:	00002d97          	auipc	s11,0x2
    80005108:	1b4d8d93          	addi	s11,s11,436 # 800072b8 <digits>
    8000510c:	00900593          	li	a1,9
    80005110:	0006051b          	sext.w	a0,a2
    80005114:	00000c93          	li	s9,0
    80005118:	02079793          	slli	a5,a5,0x20
    8000511c:	0207d793          	srli	a5,a5,0x20
    80005120:	00fd87b3          	add	a5,s11,a5
    80005124:	0007c783          	lbu	a5,0(a5)
    80005128:	02e656bb          	divuw	a3,a2,a4
    8000512c:	f8f40023          	sb	a5,-128(s0)
    80005130:	14c5d863          	bge	a1,a2,80005280 <__printf+0x278>
    80005134:	06300593          	li	a1,99
    80005138:	00100c93          	li	s9,1
    8000513c:	02e6f7bb          	remuw	a5,a3,a4
    80005140:	02079793          	slli	a5,a5,0x20
    80005144:	0207d793          	srli	a5,a5,0x20
    80005148:	00fd87b3          	add	a5,s11,a5
    8000514c:	0007c783          	lbu	a5,0(a5)
    80005150:	02e6d73b          	divuw	a4,a3,a4
    80005154:	f8f400a3          	sb	a5,-127(s0)
    80005158:	12a5f463          	bgeu	a1,a0,80005280 <__printf+0x278>
    8000515c:	00a00693          	li	a3,10
    80005160:	00900593          	li	a1,9
    80005164:	02d777bb          	remuw	a5,a4,a3
    80005168:	02079793          	slli	a5,a5,0x20
    8000516c:	0207d793          	srli	a5,a5,0x20
    80005170:	00fd87b3          	add	a5,s11,a5
    80005174:	0007c503          	lbu	a0,0(a5)
    80005178:	02d757bb          	divuw	a5,a4,a3
    8000517c:	f8a40123          	sb	a0,-126(s0)
    80005180:	48e5f263          	bgeu	a1,a4,80005604 <__printf+0x5fc>
    80005184:	06300513          	li	a0,99
    80005188:	02d7f5bb          	remuw	a1,a5,a3
    8000518c:	02059593          	slli	a1,a1,0x20
    80005190:	0205d593          	srli	a1,a1,0x20
    80005194:	00bd85b3          	add	a1,s11,a1
    80005198:	0005c583          	lbu	a1,0(a1)
    8000519c:	02d7d7bb          	divuw	a5,a5,a3
    800051a0:	f8b401a3          	sb	a1,-125(s0)
    800051a4:	48e57263          	bgeu	a0,a4,80005628 <__printf+0x620>
    800051a8:	3e700513          	li	a0,999
    800051ac:	02d7f5bb          	remuw	a1,a5,a3
    800051b0:	02059593          	slli	a1,a1,0x20
    800051b4:	0205d593          	srli	a1,a1,0x20
    800051b8:	00bd85b3          	add	a1,s11,a1
    800051bc:	0005c583          	lbu	a1,0(a1)
    800051c0:	02d7d7bb          	divuw	a5,a5,a3
    800051c4:	f8b40223          	sb	a1,-124(s0)
    800051c8:	46e57663          	bgeu	a0,a4,80005634 <__printf+0x62c>
    800051cc:	02d7f5bb          	remuw	a1,a5,a3
    800051d0:	02059593          	slli	a1,a1,0x20
    800051d4:	0205d593          	srli	a1,a1,0x20
    800051d8:	00bd85b3          	add	a1,s11,a1
    800051dc:	0005c583          	lbu	a1,0(a1)
    800051e0:	02d7d7bb          	divuw	a5,a5,a3
    800051e4:	f8b402a3          	sb	a1,-123(s0)
    800051e8:	46ea7863          	bgeu	s4,a4,80005658 <__printf+0x650>
    800051ec:	02d7f5bb          	remuw	a1,a5,a3
    800051f0:	02059593          	slli	a1,a1,0x20
    800051f4:	0205d593          	srli	a1,a1,0x20
    800051f8:	00bd85b3          	add	a1,s11,a1
    800051fc:	0005c583          	lbu	a1,0(a1)
    80005200:	02d7d7bb          	divuw	a5,a5,a3
    80005204:	f8b40323          	sb	a1,-122(s0)
    80005208:	3eeaf863          	bgeu	s5,a4,800055f8 <__printf+0x5f0>
    8000520c:	02d7f5bb          	remuw	a1,a5,a3
    80005210:	02059593          	slli	a1,a1,0x20
    80005214:	0205d593          	srli	a1,a1,0x20
    80005218:	00bd85b3          	add	a1,s11,a1
    8000521c:	0005c583          	lbu	a1,0(a1)
    80005220:	02d7d7bb          	divuw	a5,a5,a3
    80005224:	f8b403a3          	sb	a1,-121(s0)
    80005228:	42eb7e63          	bgeu	s6,a4,80005664 <__printf+0x65c>
    8000522c:	02d7f5bb          	remuw	a1,a5,a3
    80005230:	02059593          	slli	a1,a1,0x20
    80005234:	0205d593          	srli	a1,a1,0x20
    80005238:	00bd85b3          	add	a1,s11,a1
    8000523c:	0005c583          	lbu	a1,0(a1)
    80005240:	02d7d7bb          	divuw	a5,a5,a3
    80005244:	f8b40423          	sb	a1,-120(s0)
    80005248:	42ebfc63          	bgeu	s7,a4,80005680 <__printf+0x678>
    8000524c:	02079793          	slli	a5,a5,0x20
    80005250:	0207d793          	srli	a5,a5,0x20
    80005254:	00fd8db3          	add	s11,s11,a5
    80005258:	000dc703          	lbu	a4,0(s11)
    8000525c:	00a00793          	li	a5,10
    80005260:	00900c93          	li	s9,9
    80005264:	f8e404a3          	sb	a4,-119(s0)
    80005268:	00065c63          	bgez	a2,80005280 <__printf+0x278>
    8000526c:	f9040713          	addi	a4,s0,-112
    80005270:	00f70733          	add	a4,a4,a5
    80005274:	02d00693          	li	a3,45
    80005278:	fed70823          	sb	a3,-16(a4)
    8000527c:	00078c93          	mv	s9,a5
    80005280:	f8040793          	addi	a5,s0,-128
    80005284:	01978cb3          	add	s9,a5,s9
    80005288:	f7f40d13          	addi	s10,s0,-129
    8000528c:	000cc503          	lbu	a0,0(s9)
    80005290:	fffc8c93          	addi	s9,s9,-1
    80005294:	00000097          	auipc	ra,0x0
    80005298:	b90080e7          	jalr	-1136(ra) # 80004e24 <consputc>
    8000529c:	ffac98e3          	bne	s9,s10,8000528c <__printf+0x284>
    800052a0:	00094503          	lbu	a0,0(s2)
    800052a4:	e00514e3          	bnez	a0,800050ac <__printf+0xa4>
    800052a8:	1a0c1663          	bnez	s8,80005454 <__printf+0x44c>
    800052ac:	08813083          	ld	ra,136(sp)
    800052b0:	08013403          	ld	s0,128(sp)
    800052b4:	07813483          	ld	s1,120(sp)
    800052b8:	07013903          	ld	s2,112(sp)
    800052bc:	06813983          	ld	s3,104(sp)
    800052c0:	06013a03          	ld	s4,96(sp)
    800052c4:	05813a83          	ld	s5,88(sp)
    800052c8:	05013b03          	ld	s6,80(sp)
    800052cc:	04813b83          	ld	s7,72(sp)
    800052d0:	04013c03          	ld	s8,64(sp)
    800052d4:	03813c83          	ld	s9,56(sp)
    800052d8:	03013d03          	ld	s10,48(sp)
    800052dc:	02813d83          	ld	s11,40(sp)
    800052e0:	0d010113          	addi	sp,sp,208
    800052e4:	00008067          	ret
    800052e8:	07300713          	li	a4,115
    800052ec:	1ce78a63          	beq	a5,a4,800054c0 <__printf+0x4b8>
    800052f0:	07800713          	li	a4,120
    800052f4:	1ee79e63          	bne	a5,a4,800054f0 <__printf+0x4e8>
    800052f8:	f7843783          	ld	a5,-136(s0)
    800052fc:	0007a703          	lw	a4,0(a5)
    80005300:	00878793          	addi	a5,a5,8
    80005304:	f6f43c23          	sd	a5,-136(s0)
    80005308:	28074263          	bltz	a4,8000558c <__printf+0x584>
    8000530c:	00002d97          	auipc	s11,0x2
    80005310:	facd8d93          	addi	s11,s11,-84 # 800072b8 <digits>
    80005314:	00f77793          	andi	a5,a4,15
    80005318:	00fd87b3          	add	a5,s11,a5
    8000531c:	0007c683          	lbu	a3,0(a5)
    80005320:	00f00613          	li	a2,15
    80005324:	0007079b          	sext.w	a5,a4
    80005328:	f8d40023          	sb	a3,-128(s0)
    8000532c:	0047559b          	srliw	a1,a4,0x4
    80005330:	0047569b          	srliw	a3,a4,0x4
    80005334:	00000c93          	li	s9,0
    80005338:	0ee65063          	bge	a2,a4,80005418 <__printf+0x410>
    8000533c:	00f6f693          	andi	a3,a3,15
    80005340:	00dd86b3          	add	a3,s11,a3
    80005344:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005348:	0087d79b          	srliw	a5,a5,0x8
    8000534c:	00100c93          	li	s9,1
    80005350:	f8d400a3          	sb	a3,-127(s0)
    80005354:	0cb67263          	bgeu	a2,a1,80005418 <__printf+0x410>
    80005358:	00f7f693          	andi	a3,a5,15
    8000535c:	00dd86b3          	add	a3,s11,a3
    80005360:	0006c583          	lbu	a1,0(a3)
    80005364:	00f00613          	li	a2,15
    80005368:	0047d69b          	srliw	a3,a5,0x4
    8000536c:	f8b40123          	sb	a1,-126(s0)
    80005370:	0047d593          	srli	a1,a5,0x4
    80005374:	28f67e63          	bgeu	a2,a5,80005610 <__printf+0x608>
    80005378:	00f6f693          	andi	a3,a3,15
    8000537c:	00dd86b3          	add	a3,s11,a3
    80005380:	0006c503          	lbu	a0,0(a3)
    80005384:	0087d813          	srli	a6,a5,0x8
    80005388:	0087d69b          	srliw	a3,a5,0x8
    8000538c:	f8a401a3          	sb	a0,-125(s0)
    80005390:	28b67663          	bgeu	a2,a1,8000561c <__printf+0x614>
    80005394:	00f6f693          	andi	a3,a3,15
    80005398:	00dd86b3          	add	a3,s11,a3
    8000539c:	0006c583          	lbu	a1,0(a3)
    800053a0:	00c7d513          	srli	a0,a5,0xc
    800053a4:	00c7d69b          	srliw	a3,a5,0xc
    800053a8:	f8b40223          	sb	a1,-124(s0)
    800053ac:	29067a63          	bgeu	a2,a6,80005640 <__printf+0x638>
    800053b0:	00f6f693          	andi	a3,a3,15
    800053b4:	00dd86b3          	add	a3,s11,a3
    800053b8:	0006c583          	lbu	a1,0(a3)
    800053bc:	0107d813          	srli	a6,a5,0x10
    800053c0:	0107d69b          	srliw	a3,a5,0x10
    800053c4:	f8b402a3          	sb	a1,-123(s0)
    800053c8:	28a67263          	bgeu	a2,a0,8000564c <__printf+0x644>
    800053cc:	00f6f693          	andi	a3,a3,15
    800053d0:	00dd86b3          	add	a3,s11,a3
    800053d4:	0006c683          	lbu	a3,0(a3)
    800053d8:	0147d79b          	srliw	a5,a5,0x14
    800053dc:	f8d40323          	sb	a3,-122(s0)
    800053e0:	21067663          	bgeu	a2,a6,800055ec <__printf+0x5e4>
    800053e4:	02079793          	slli	a5,a5,0x20
    800053e8:	0207d793          	srli	a5,a5,0x20
    800053ec:	00fd8db3          	add	s11,s11,a5
    800053f0:	000dc683          	lbu	a3,0(s11)
    800053f4:	00800793          	li	a5,8
    800053f8:	00700c93          	li	s9,7
    800053fc:	f8d403a3          	sb	a3,-121(s0)
    80005400:	00075c63          	bgez	a4,80005418 <__printf+0x410>
    80005404:	f9040713          	addi	a4,s0,-112
    80005408:	00f70733          	add	a4,a4,a5
    8000540c:	02d00693          	li	a3,45
    80005410:	fed70823          	sb	a3,-16(a4)
    80005414:	00078c93          	mv	s9,a5
    80005418:	f8040793          	addi	a5,s0,-128
    8000541c:	01978cb3          	add	s9,a5,s9
    80005420:	f7f40d13          	addi	s10,s0,-129
    80005424:	000cc503          	lbu	a0,0(s9)
    80005428:	fffc8c93          	addi	s9,s9,-1
    8000542c:	00000097          	auipc	ra,0x0
    80005430:	9f8080e7          	jalr	-1544(ra) # 80004e24 <consputc>
    80005434:	ff9d18e3          	bne	s10,s9,80005424 <__printf+0x41c>
    80005438:	0100006f          	j	80005448 <__printf+0x440>
    8000543c:	00000097          	auipc	ra,0x0
    80005440:	9e8080e7          	jalr	-1560(ra) # 80004e24 <consputc>
    80005444:	000c8493          	mv	s1,s9
    80005448:	00094503          	lbu	a0,0(s2)
    8000544c:	c60510e3          	bnez	a0,800050ac <__printf+0xa4>
    80005450:	e40c0ee3          	beqz	s8,800052ac <__printf+0x2a4>
    80005454:	00004517          	auipc	a0,0x4
    80005458:	7ec50513          	addi	a0,a0,2028 # 80009c40 <pr>
    8000545c:	00001097          	auipc	ra,0x1
    80005460:	94c080e7          	jalr	-1716(ra) # 80005da8 <release>
    80005464:	e49ff06f          	j	800052ac <__printf+0x2a4>
    80005468:	f7843783          	ld	a5,-136(s0)
    8000546c:	03000513          	li	a0,48
    80005470:	01000d13          	li	s10,16
    80005474:	00878713          	addi	a4,a5,8
    80005478:	0007bc83          	ld	s9,0(a5)
    8000547c:	f6e43c23          	sd	a4,-136(s0)
    80005480:	00000097          	auipc	ra,0x0
    80005484:	9a4080e7          	jalr	-1628(ra) # 80004e24 <consputc>
    80005488:	07800513          	li	a0,120
    8000548c:	00000097          	auipc	ra,0x0
    80005490:	998080e7          	jalr	-1640(ra) # 80004e24 <consputc>
    80005494:	00002d97          	auipc	s11,0x2
    80005498:	e24d8d93          	addi	s11,s11,-476 # 800072b8 <digits>
    8000549c:	03ccd793          	srli	a5,s9,0x3c
    800054a0:	00fd87b3          	add	a5,s11,a5
    800054a4:	0007c503          	lbu	a0,0(a5)
    800054a8:	fffd0d1b          	addiw	s10,s10,-1
    800054ac:	004c9c93          	slli	s9,s9,0x4
    800054b0:	00000097          	auipc	ra,0x0
    800054b4:	974080e7          	jalr	-1676(ra) # 80004e24 <consputc>
    800054b8:	fe0d12e3          	bnez	s10,8000549c <__printf+0x494>
    800054bc:	f8dff06f          	j	80005448 <__printf+0x440>
    800054c0:	f7843783          	ld	a5,-136(s0)
    800054c4:	0007bc83          	ld	s9,0(a5)
    800054c8:	00878793          	addi	a5,a5,8
    800054cc:	f6f43c23          	sd	a5,-136(s0)
    800054d0:	000c9a63          	bnez	s9,800054e4 <__printf+0x4dc>
    800054d4:	1080006f          	j	800055dc <__printf+0x5d4>
    800054d8:	001c8c93          	addi	s9,s9,1
    800054dc:	00000097          	auipc	ra,0x0
    800054e0:	948080e7          	jalr	-1720(ra) # 80004e24 <consputc>
    800054e4:	000cc503          	lbu	a0,0(s9)
    800054e8:	fe0518e3          	bnez	a0,800054d8 <__printf+0x4d0>
    800054ec:	f5dff06f          	j	80005448 <__printf+0x440>
    800054f0:	02500513          	li	a0,37
    800054f4:	00000097          	auipc	ra,0x0
    800054f8:	930080e7          	jalr	-1744(ra) # 80004e24 <consputc>
    800054fc:	000c8513          	mv	a0,s9
    80005500:	00000097          	auipc	ra,0x0
    80005504:	924080e7          	jalr	-1756(ra) # 80004e24 <consputc>
    80005508:	f41ff06f          	j	80005448 <__printf+0x440>
    8000550c:	02500513          	li	a0,37
    80005510:	00000097          	auipc	ra,0x0
    80005514:	914080e7          	jalr	-1772(ra) # 80004e24 <consputc>
    80005518:	f31ff06f          	j	80005448 <__printf+0x440>
    8000551c:	00030513          	mv	a0,t1
    80005520:	00000097          	auipc	ra,0x0
    80005524:	7bc080e7          	jalr	1980(ra) # 80005cdc <acquire>
    80005528:	b4dff06f          	j	80005074 <__printf+0x6c>
    8000552c:	40c0053b          	negw	a0,a2
    80005530:	00a00713          	li	a4,10
    80005534:	02e576bb          	remuw	a3,a0,a4
    80005538:	00002d97          	auipc	s11,0x2
    8000553c:	d80d8d93          	addi	s11,s11,-640 # 800072b8 <digits>
    80005540:	ff700593          	li	a1,-9
    80005544:	02069693          	slli	a3,a3,0x20
    80005548:	0206d693          	srli	a3,a3,0x20
    8000554c:	00dd86b3          	add	a3,s11,a3
    80005550:	0006c683          	lbu	a3,0(a3)
    80005554:	02e557bb          	divuw	a5,a0,a4
    80005558:	f8d40023          	sb	a3,-128(s0)
    8000555c:	10b65e63          	bge	a2,a1,80005678 <__printf+0x670>
    80005560:	06300593          	li	a1,99
    80005564:	02e7f6bb          	remuw	a3,a5,a4
    80005568:	02069693          	slli	a3,a3,0x20
    8000556c:	0206d693          	srli	a3,a3,0x20
    80005570:	00dd86b3          	add	a3,s11,a3
    80005574:	0006c683          	lbu	a3,0(a3)
    80005578:	02e7d73b          	divuw	a4,a5,a4
    8000557c:	00200793          	li	a5,2
    80005580:	f8d400a3          	sb	a3,-127(s0)
    80005584:	bca5ece3          	bltu	a1,a0,8000515c <__printf+0x154>
    80005588:	ce5ff06f          	j	8000526c <__printf+0x264>
    8000558c:	40e007bb          	negw	a5,a4
    80005590:	00002d97          	auipc	s11,0x2
    80005594:	d28d8d93          	addi	s11,s11,-728 # 800072b8 <digits>
    80005598:	00f7f693          	andi	a3,a5,15
    8000559c:	00dd86b3          	add	a3,s11,a3
    800055a0:	0006c583          	lbu	a1,0(a3)
    800055a4:	ff100613          	li	a2,-15
    800055a8:	0047d69b          	srliw	a3,a5,0x4
    800055ac:	f8b40023          	sb	a1,-128(s0)
    800055b0:	0047d59b          	srliw	a1,a5,0x4
    800055b4:	0ac75e63          	bge	a4,a2,80005670 <__printf+0x668>
    800055b8:	00f6f693          	andi	a3,a3,15
    800055bc:	00dd86b3          	add	a3,s11,a3
    800055c0:	0006c603          	lbu	a2,0(a3)
    800055c4:	00f00693          	li	a3,15
    800055c8:	0087d79b          	srliw	a5,a5,0x8
    800055cc:	f8c400a3          	sb	a2,-127(s0)
    800055d0:	d8b6e4e3          	bltu	a3,a1,80005358 <__printf+0x350>
    800055d4:	00200793          	li	a5,2
    800055d8:	e2dff06f          	j	80005404 <__printf+0x3fc>
    800055dc:	00002c97          	auipc	s9,0x2
    800055e0:	cbcc8c93          	addi	s9,s9,-836 # 80007298 <CONSOLE_STATUS+0x288>
    800055e4:	02800513          	li	a0,40
    800055e8:	ef1ff06f          	j	800054d8 <__printf+0x4d0>
    800055ec:	00700793          	li	a5,7
    800055f0:	00600c93          	li	s9,6
    800055f4:	e0dff06f          	j	80005400 <__printf+0x3f8>
    800055f8:	00700793          	li	a5,7
    800055fc:	00600c93          	li	s9,6
    80005600:	c69ff06f          	j	80005268 <__printf+0x260>
    80005604:	00300793          	li	a5,3
    80005608:	00200c93          	li	s9,2
    8000560c:	c5dff06f          	j	80005268 <__printf+0x260>
    80005610:	00300793          	li	a5,3
    80005614:	00200c93          	li	s9,2
    80005618:	de9ff06f          	j	80005400 <__printf+0x3f8>
    8000561c:	00400793          	li	a5,4
    80005620:	00300c93          	li	s9,3
    80005624:	dddff06f          	j	80005400 <__printf+0x3f8>
    80005628:	00400793          	li	a5,4
    8000562c:	00300c93          	li	s9,3
    80005630:	c39ff06f          	j	80005268 <__printf+0x260>
    80005634:	00500793          	li	a5,5
    80005638:	00400c93          	li	s9,4
    8000563c:	c2dff06f          	j	80005268 <__printf+0x260>
    80005640:	00500793          	li	a5,5
    80005644:	00400c93          	li	s9,4
    80005648:	db9ff06f          	j	80005400 <__printf+0x3f8>
    8000564c:	00600793          	li	a5,6
    80005650:	00500c93          	li	s9,5
    80005654:	dadff06f          	j	80005400 <__printf+0x3f8>
    80005658:	00600793          	li	a5,6
    8000565c:	00500c93          	li	s9,5
    80005660:	c09ff06f          	j	80005268 <__printf+0x260>
    80005664:	00800793          	li	a5,8
    80005668:	00700c93          	li	s9,7
    8000566c:	bfdff06f          	j	80005268 <__printf+0x260>
    80005670:	00100793          	li	a5,1
    80005674:	d91ff06f          	j	80005404 <__printf+0x3fc>
    80005678:	00100793          	li	a5,1
    8000567c:	bf1ff06f          	j	8000526c <__printf+0x264>
    80005680:	00900793          	li	a5,9
    80005684:	00800c93          	li	s9,8
    80005688:	be1ff06f          	j	80005268 <__printf+0x260>
    8000568c:	00002517          	auipc	a0,0x2
    80005690:	c1450513          	addi	a0,a0,-1004 # 800072a0 <CONSOLE_STATUS+0x290>
    80005694:	00000097          	auipc	ra,0x0
    80005698:	918080e7          	jalr	-1768(ra) # 80004fac <panic>

000000008000569c <printfinit>:
    8000569c:	fe010113          	addi	sp,sp,-32
    800056a0:	00813823          	sd	s0,16(sp)
    800056a4:	00913423          	sd	s1,8(sp)
    800056a8:	00113c23          	sd	ra,24(sp)
    800056ac:	02010413          	addi	s0,sp,32
    800056b0:	00004497          	auipc	s1,0x4
    800056b4:	59048493          	addi	s1,s1,1424 # 80009c40 <pr>
    800056b8:	00048513          	mv	a0,s1
    800056bc:	00002597          	auipc	a1,0x2
    800056c0:	bf458593          	addi	a1,a1,-1036 # 800072b0 <CONSOLE_STATUS+0x2a0>
    800056c4:	00000097          	auipc	ra,0x0
    800056c8:	5f4080e7          	jalr	1524(ra) # 80005cb8 <initlock>
    800056cc:	01813083          	ld	ra,24(sp)
    800056d0:	01013403          	ld	s0,16(sp)
    800056d4:	0004ac23          	sw	zero,24(s1)
    800056d8:	00813483          	ld	s1,8(sp)
    800056dc:	02010113          	addi	sp,sp,32
    800056e0:	00008067          	ret

00000000800056e4 <uartinit>:
    800056e4:	ff010113          	addi	sp,sp,-16
    800056e8:	00813423          	sd	s0,8(sp)
    800056ec:	01010413          	addi	s0,sp,16
    800056f0:	100007b7          	lui	a5,0x10000
    800056f4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800056f8:	f8000713          	li	a4,-128
    800056fc:	00e781a3          	sb	a4,3(a5)
    80005700:	00300713          	li	a4,3
    80005704:	00e78023          	sb	a4,0(a5)
    80005708:	000780a3          	sb	zero,1(a5)
    8000570c:	00e781a3          	sb	a4,3(a5)
    80005710:	00700693          	li	a3,7
    80005714:	00d78123          	sb	a3,2(a5)
    80005718:	00e780a3          	sb	a4,1(a5)
    8000571c:	00813403          	ld	s0,8(sp)
    80005720:	01010113          	addi	sp,sp,16
    80005724:	00008067          	ret

0000000080005728 <uartputc>:
    80005728:	00003797          	auipc	a5,0x3
    8000572c:	2807a783          	lw	a5,640(a5) # 800089a8 <panicked>
    80005730:	00078463          	beqz	a5,80005738 <uartputc+0x10>
    80005734:	0000006f          	j	80005734 <uartputc+0xc>
    80005738:	fd010113          	addi	sp,sp,-48
    8000573c:	02813023          	sd	s0,32(sp)
    80005740:	00913c23          	sd	s1,24(sp)
    80005744:	01213823          	sd	s2,16(sp)
    80005748:	01313423          	sd	s3,8(sp)
    8000574c:	02113423          	sd	ra,40(sp)
    80005750:	03010413          	addi	s0,sp,48
    80005754:	00003917          	auipc	s2,0x3
    80005758:	25c90913          	addi	s2,s2,604 # 800089b0 <uart_tx_r>
    8000575c:	00093783          	ld	a5,0(s2)
    80005760:	00003497          	auipc	s1,0x3
    80005764:	25848493          	addi	s1,s1,600 # 800089b8 <uart_tx_w>
    80005768:	0004b703          	ld	a4,0(s1)
    8000576c:	02078693          	addi	a3,a5,32
    80005770:	00050993          	mv	s3,a0
    80005774:	02e69c63          	bne	a3,a4,800057ac <uartputc+0x84>
    80005778:	00001097          	auipc	ra,0x1
    8000577c:	834080e7          	jalr	-1996(ra) # 80005fac <push_on>
    80005780:	00093783          	ld	a5,0(s2)
    80005784:	0004b703          	ld	a4,0(s1)
    80005788:	02078793          	addi	a5,a5,32
    8000578c:	00e79463          	bne	a5,a4,80005794 <uartputc+0x6c>
    80005790:	0000006f          	j	80005790 <uartputc+0x68>
    80005794:	00001097          	auipc	ra,0x1
    80005798:	88c080e7          	jalr	-1908(ra) # 80006020 <pop_on>
    8000579c:	00093783          	ld	a5,0(s2)
    800057a0:	0004b703          	ld	a4,0(s1)
    800057a4:	02078693          	addi	a3,a5,32
    800057a8:	fce688e3          	beq	a3,a4,80005778 <uartputc+0x50>
    800057ac:	01f77693          	andi	a3,a4,31
    800057b0:	00004597          	auipc	a1,0x4
    800057b4:	4b058593          	addi	a1,a1,1200 # 80009c60 <uart_tx_buf>
    800057b8:	00d586b3          	add	a3,a1,a3
    800057bc:	00170713          	addi	a4,a4,1
    800057c0:	01368023          	sb	s3,0(a3)
    800057c4:	00e4b023          	sd	a4,0(s1)
    800057c8:	10000637          	lui	a2,0x10000
    800057cc:	02f71063          	bne	a4,a5,800057ec <uartputc+0xc4>
    800057d0:	0340006f          	j	80005804 <uartputc+0xdc>
    800057d4:	00074703          	lbu	a4,0(a4)
    800057d8:	00f93023          	sd	a5,0(s2)
    800057dc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800057e0:	00093783          	ld	a5,0(s2)
    800057e4:	0004b703          	ld	a4,0(s1)
    800057e8:	00f70e63          	beq	a4,a5,80005804 <uartputc+0xdc>
    800057ec:	00564683          	lbu	a3,5(a2)
    800057f0:	01f7f713          	andi	a4,a5,31
    800057f4:	00e58733          	add	a4,a1,a4
    800057f8:	0206f693          	andi	a3,a3,32
    800057fc:	00178793          	addi	a5,a5,1
    80005800:	fc069ae3          	bnez	a3,800057d4 <uartputc+0xac>
    80005804:	02813083          	ld	ra,40(sp)
    80005808:	02013403          	ld	s0,32(sp)
    8000580c:	01813483          	ld	s1,24(sp)
    80005810:	01013903          	ld	s2,16(sp)
    80005814:	00813983          	ld	s3,8(sp)
    80005818:	03010113          	addi	sp,sp,48
    8000581c:	00008067          	ret

0000000080005820 <uartputc_sync>:
    80005820:	ff010113          	addi	sp,sp,-16
    80005824:	00813423          	sd	s0,8(sp)
    80005828:	01010413          	addi	s0,sp,16
    8000582c:	00003717          	auipc	a4,0x3
    80005830:	17c72703          	lw	a4,380(a4) # 800089a8 <panicked>
    80005834:	02071663          	bnez	a4,80005860 <uartputc_sync+0x40>
    80005838:	00050793          	mv	a5,a0
    8000583c:	100006b7          	lui	a3,0x10000
    80005840:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005844:	02077713          	andi	a4,a4,32
    80005848:	fe070ce3          	beqz	a4,80005840 <uartputc_sync+0x20>
    8000584c:	0ff7f793          	andi	a5,a5,255
    80005850:	00f68023          	sb	a5,0(a3)
    80005854:	00813403          	ld	s0,8(sp)
    80005858:	01010113          	addi	sp,sp,16
    8000585c:	00008067          	ret
    80005860:	0000006f          	j	80005860 <uartputc_sync+0x40>

0000000080005864 <uartstart>:
    80005864:	ff010113          	addi	sp,sp,-16
    80005868:	00813423          	sd	s0,8(sp)
    8000586c:	01010413          	addi	s0,sp,16
    80005870:	00003617          	auipc	a2,0x3
    80005874:	14060613          	addi	a2,a2,320 # 800089b0 <uart_tx_r>
    80005878:	00003517          	auipc	a0,0x3
    8000587c:	14050513          	addi	a0,a0,320 # 800089b8 <uart_tx_w>
    80005880:	00063783          	ld	a5,0(a2)
    80005884:	00053703          	ld	a4,0(a0)
    80005888:	04f70263          	beq	a4,a5,800058cc <uartstart+0x68>
    8000588c:	100005b7          	lui	a1,0x10000
    80005890:	00004817          	auipc	a6,0x4
    80005894:	3d080813          	addi	a6,a6,976 # 80009c60 <uart_tx_buf>
    80005898:	01c0006f          	j	800058b4 <uartstart+0x50>
    8000589c:	0006c703          	lbu	a4,0(a3)
    800058a0:	00f63023          	sd	a5,0(a2)
    800058a4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800058a8:	00063783          	ld	a5,0(a2)
    800058ac:	00053703          	ld	a4,0(a0)
    800058b0:	00f70e63          	beq	a4,a5,800058cc <uartstart+0x68>
    800058b4:	01f7f713          	andi	a4,a5,31
    800058b8:	00e806b3          	add	a3,a6,a4
    800058bc:	0055c703          	lbu	a4,5(a1)
    800058c0:	00178793          	addi	a5,a5,1
    800058c4:	02077713          	andi	a4,a4,32
    800058c8:	fc071ae3          	bnez	a4,8000589c <uartstart+0x38>
    800058cc:	00813403          	ld	s0,8(sp)
    800058d0:	01010113          	addi	sp,sp,16
    800058d4:	00008067          	ret

00000000800058d8 <uartgetc>:
    800058d8:	ff010113          	addi	sp,sp,-16
    800058dc:	00813423          	sd	s0,8(sp)
    800058e0:	01010413          	addi	s0,sp,16
    800058e4:	10000737          	lui	a4,0x10000
    800058e8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800058ec:	0017f793          	andi	a5,a5,1
    800058f0:	00078c63          	beqz	a5,80005908 <uartgetc+0x30>
    800058f4:	00074503          	lbu	a0,0(a4)
    800058f8:	0ff57513          	andi	a0,a0,255
    800058fc:	00813403          	ld	s0,8(sp)
    80005900:	01010113          	addi	sp,sp,16
    80005904:	00008067          	ret
    80005908:	fff00513          	li	a0,-1
    8000590c:	ff1ff06f          	j	800058fc <uartgetc+0x24>

0000000080005910 <uartintr>:
    80005910:	100007b7          	lui	a5,0x10000
    80005914:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005918:	0017f793          	andi	a5,a5,1
    8000591c:	0a078463          	beqz	a5,800059c4 <uartintr+0xb4>
    80005920:	fe010113          	addi	sp,sp,-32
    80005924:	00813823          	sd	s0,16(sp)
    80005928:	00913423          	sd	s1,8(sp)
    8000592c:	00113c23          	sd	ra,24(sp)
    80005930:	02010413          	addi	s0,sp,32
    80005934:	100004b7          	lui	s1,0x10000
    80005938:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000593c:	0ff57513          	andi	a0,a0,255
    80005940:	fffff097          	auipc	ra,0xfffff
    80005944:	534080e7          	jalr	1332(ra) # 80004e74 <consoleintr>
    80005948:	0054c783          	lbu	a5,5(s1)
    8000594c:	0017f793          	andi	a5,a5,1
    80005950:	fe0794e3          	bnez	a5,80005938 <uartintr+0x28>
    80005954:	00003617          	auipc	a2,0x3
    80005958:	05c60613          	addi	a2,a2,92 # 800089b0 <uart_tx_r>
    8000595c:	00003517          	auipc	a0,0x3
    80005960:	05c50513          	addi	a0,a0,92 # 800089b8 <uart_tx_w>
    80005964:	00063783          	ld	a5,0(a2)
    80005968:	00053703          	ld	a4,0(a0)
    8000596c:	04f70263          	beq	a4,a5,800059b0 <uartintr+0xa0>
    80005970:	100005b7          	lui	a1,0x10000
    80005974:	00004817          	auipc	a6,0x4
    80005978:	2ec80813          	addi	a6,a6,748 # 80009c60 <uart_tx_buf>
    8000597c:	01c0006f          	j	80005998 <uartintr+0x88>
    80005980:	0006c703          	lbu	a4,0(a3)
    80005984:	00f63023          	sd	a5,0(a2)
    80005988:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000598c:	00063783          	ld	a5,0(a2)
    80005990:	00053703          	ld	a4,0(a0)
    80005994:	00f70e63          	beq	a4,a5,800059b0 <uartintr+0xa0>
    80005998:	01f7f713          	andi	a4,a5,31
    8000599c:	00e806b3          	add	a3,a6,a4
    800059a0:	0055c703          	lbu	a4,5(a1)
    800059a4:	00178793          	addi	a5,a5,1
    800059a8:	02077713          	andi	a4,a4,32
    800059ac:	fc071ae3          	bnez	a4,80005980 <uartintr+0x70>
    800059b0:	01813083          	ld	ra,24(sp)
    800059b4:	01013403          	ld	s0,16(sp)
    800059b8:	00813483          	ld	s1,8(sp)
    800059bc:	02010113          	addi	sp,sp,32
    800059c0:	00008067          	ret
    800059c4:	00003617          	auipc	a2,0x3
    800059c8:	fec60613          	addi	a2,a2,-20 # 800089b0 <uart_tx_r>
    800059cc:	00003517          	auipc	a0,0x3
    800059d0:	fec50513          	addi	a0,a0,-20 # 800089b8 <uart_tx_w>
    800059d4:	00063783          	ld	a5,0(a2)
    800059d8:	00053703          	ld	a4,0(a0)
    800059dc:	04f70263          	beq	a4,a5,80005a20 <uartintr+0x110>
    800059e0:	100005b7          	lui	a1,0x10000
    800059e4:	00004817          	auipc	a6,0x4
    800059e8:	27c80813          	addi	a6,a6,636 # 80009c60 <uart_tx_buf>
    800059ec:	01c0006f          	j	80005a08 <uartintr+0xf8>
    800059f0:	0006c703          	lbu	a4,0(a3)
    800059f4:	00f63023          	sd	a5,0(a2)
    800059f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800059fc:	00063783          	ld	a5,0(a2)
    80005a00:	00053703          	ld	a4,0(a0)
    80005a04:	02f70063          	beq	a4,a5,80005a24 <uartintr+0x114>
    80005a08:	01f7f713          	andi	a4,a5,31
    80005a0c:	00e806b3          	add	a3,a6,a4
    80005a10:	0055c703          	lbu	a4,5(a1)
    80005a14:	00178793          	addi	a5,a5,1
    80005a18:	02077713          	andi	a4,a4,32
    80005a1c:	fc071ae3          	bnez	a4,800059f0 <uartintr+0xe0>
    80005a20:	00008067          	ret
    80005a24:	00008067          	ret

0000000080005a28 <kinit>:
    80005a28:	fc010113          	addi	sp,sp,-64
    80005a2c:	02913423          	sd	s1,40(sp)
    80005a30:	fffff7b7          	lui	a5,0xfffff
    80005a34:	00005497          	auipc	s1,0x5
    80005a38:	24b48493          	addi	s1,s1,587 # 8000ac7f <end+0xfff>
    80005a3c:	02813823          	sd	s0,48(sp)
    80005a40:	01313c23          	sd	s3,24(sp)
    80005a44:	00f4f4b3          	and	s1,s1,a5
    80005a48:	02113c23          	sd	ra,56(sp)
    80005a4c:	03213023          	sd	s2,32(sp)
    80005a50:	01413823          	sd	s4,16(sp)
    80005a54:	01513423          	sd	s5,8(sp)
    80005a58:	04010413          	addi	s0,sp,64
    80005a5c:	000017b7          	lui	a5,0x1
    80005a60:	01100993          	li	s3,17
    80005a64:	00f487b3          	add	a5,s1,a5
    80005a68:	01b99993          	slli	s3,s3,0x1b
    80005a6c:	06f9e063          	bltu	s3,a5,80005acc <kinit+0xa4>
    80005a70:	00004a97          	auipc	s5,0x4
    80005a74:	210a8a93          	addi	s5,s5,528 # 80009c80 <end>
    80005a78:	0754ec63          	bltu	s1,s5,80005af0 <kinit+0xc8>
    80005a7c:	0734fa63          	bgeu	s1,s3,80005af0 <kinit+0xc8>
    80005a80:	00088a37          	lui	s4,0x88
    80005a84:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005a88:	00003917          	auipc	s2,0x3
    80005a8c:	f3890913          	addi	s2,s2,-200 # 800089c0 <kmem>
    80005a90:	00ca1a13          	slli	s4,s4,0xc
    80005a94:	0140006f          	j	80005aa8 <kinit+0x80>
    80005a98:	000017b7          	lui	a5,0x1
    80005a9c:	00f484b3          	add	s1,s1,a5
    80005aa0:	0554e863          	bltu	s1,s5,80005af0 <kinit+0xc8>
    80005aa4:	0534f663          	bgeu	s1,s3,80005af0 <kinit+0xc8>
    80005aa8:	00001637          	lui	a2,0x1
    80005aac:	00100593          	li	a1,1
    80005ab0:	00048513          	mv	a0,s1
    80005ab4:	00000097          	auipc	ra,0x0
    80005ab8:	5e4080e7          	jalr	1508(ra) # 80006098 <__memset>
    80005abc:	00093783          	ld	a5,0(s2)
    80005ac0:	00f4b023          	sd	a5,0(s1)
    80005ac4:	00993023          	sd	s1,0(s2)
    80005ac8:	fd4498e3          	bne	s1,s4,80005a98 <kinit+0x70>
    80005acc:	03813083          	ld	ra,56(sp)
    80005ad0:	03013403          	ld	s0,48(sp)
    80005ad4:	02813483          	ld	s1,40(sp)
    80005ad8:	02013903          	ld	s2,32(sp)
    80005adc:	01813983          	ld	s3,24(sp)
    80005ae0:	01013a03          	ld	s4,16(sp)
    80005ae4:	00813a83          	ld	s5,8(sp)
    80005ae8:	04010113          	addi	sp,sp,64
    80005aec:	00008067          	ret
    80005af0:	00001517          	auipc	a0,0x1
    80005af4:	7e050513          	addi	a0,a0,2016 # 800072d0 <digits+0x18>
    80005af8:	fffff097          	auipc	ra,0xfffff
    80005afc:	4b4080e7          	jalr	1204(ra) # 80004fac <panic>

0000000080005b00 <freerange>:
    80005b00:	fc010113          	addi	sp,sp,-64
    80005b04:	000017b7          	lui	a5,0x1
    80005b08:	02913423          	sd	s1,40(sp)
    80005b0c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005b10:	009504b3          	add	s1,a0,s1
    80005b14:	fffff537          	lui	a0,0xfffff
    80005b18:	02813823          	sd	s0,48(sp)
    80005b1c:	02113c23          	sd	ra,56(sp)
    80005b20:	03213023          	sd	s2,32(sp)
    80005b24:	01313c23          	sd	s3,24(sp)
    80005b28:	01413823          	sd	s4,16(sp)
    80005b2c:	01513423          	sd	s5,8(sp)
    80005b30:	01613023          	sd	s6,0(sp)
    80005b34:	04010413          	addi	s0,sp,64
    80005b38:	00a4f4b3          	and	s1,s1,a0
    80005b3c:	00f487b3          	add	a5,s1,a5
    80005b40:	06f5e463          	bltu	a1,a5,80005ba8 <freerange+0xa8>
    80005b44:	00004a97          	auipc	s5,0x4
    80005b48:	13ca8a93          	addi	s5,s5,316 # 80009c80 <end>
    80005b4c:	0954e263          	bltu	s1,s5,80005bd0 <freerange+0xd0>
    80005b50:	01100993          	li	s3,17
    80005b54:	01b99993          	slli	s3,s3,0x1b
    80005b58:	0734fc63          	bgeu	s1,s3,80005bd0 <freerange+0xd0>
    80005b5c:	00058a13          	mv	s4,a1
    80005b60:	00003917          	auipc	s2,0x3
    80005b64:	e6090913          	addi	s2,s2,-416 # 800089c0 <kmem>
    80005b68:	00002b37          	lui	s6,0x2
    80005b6c:	0140006f          	j	80005b80 <freerange+0x80>
    80005b70:	000017b7          	lui	a5,0x1
    80005b74:	00f484b3          	add	s1,s1,a5
    80005b78:	0554ec63          	bltu	s1,s5,80005bd0 <freerange+0xd0>
    80005b7c:	0534fa63          	bgeu	s1,s3,80005bd0 <freerange+0xd0>
    80005b80:	00001637          	lui	a2,0x1
    80005b84:	00100593          	li	a1,1
    80005b88:	00048513          	mv	a0,s1
    80005b8c:	00000097          	auipc	ra,0x0
    80005b90:	50c080e7          	jalr	1292(ra) # 80006098 <__memset>
    80005b94:	00093703          	ld	a4,0(s2)
    80005b98:	016487b3          	add	a5,s1,s6
    80005b9c:	00e4b023          	sd	a4,0(s1)
    80005ba0:	00993023          	sd	s1,0(s2)
    80005ba4:	fcfa76e3          	bgeu	s4,a5,80005b70 <freerange+0x70>
    80005ba8:	03813083          	ld	ra,56(sp)
    80005bac:	03013403          	ld	s0,48(sp)
    80005bb0:	02813483          	ld	s1,40(sp)
    80005bb4:	02013903          	ld	s2,32(sp)
    80005bb8:	01813983          	ld	s3,24(sp)
    80005bbc:	01013a03          	ld	s4,16(sp)
    80005bc0:	00813a83          	ld	s5,8(sp)
    80005bc4:	00013b03          	ld	s6,0(sp)
    80005bc8:	04010113          	addi	sp,sp,64
    80005bcc:	00008067          	ret
    80005bd0:	00001517          	auipc	a0,0x1
    80005bd4:	70050513          	addi	a0,a0,1792 # 800072d0 <digits+0x18>
    80005bd8:	fffff097          	auipc	ra,0xfffff
    80005bdc:	3d4080e7          	jalr	980(ra) # 80004fac <panic>

0000000080005be0 <kfree>:
    80005be0:	fe010113          	addi	sp,sp,-32
    80005be4:	00813823          	sd	s0,16(sp)
    80005be8:	00113c23          	sd	ra,24(sp)
    80005bec:	00913423          	sd	s1,8(sp)
    80005bf0:	02010413          	addi	s0,sp,32
    80005bf4:	03451793          	slli	a5,a0,0x34
    80005bf8:	04079c63          	bnez	a5,80005c50 <kfree+0x70>
    80005bfc:	00004797          	auipc	a5,0x4
    80005c00:	08478793          	addi	a5,a5,132 # 80009c80 <end>
    80005c04:	00050493          	mv	s1,a0
    80005c08:	04f56463          	bltu	a0,a5,80005c50 <kfree+0x70>
    80005c0c:	01100793          	li	a5,17
    80005c10:	01b79793          	slli	a5,a5,0x1b
    80005c14:	02f57e63          	bgeu	a0,a5,80005c50 <kfree+0x70>
    80005c18:	00001637          	lui	a2,0x1
    80005c1c:	00100593          	li	a1,1
    80005c20:	00000097          	auipc	ra,0x0
    80005c24:	478080e7          	jalr	1144(ra) # 80006098 <__memset>
    80005c28:	00003797          	auipc	a5,0x3
    80005c2c:	d9878793          	addi	a5,a5,-616 # 800089c0 <kmem>
    80005c30:	0007b703          	ld	a4,0(a5)
    80005c34:	01813083          	ld	ra,24(sp)
    80005c38:	01013403          	ld	s0,16(sp)
    80005c3c:	00e4b023          	sd	a4,0(s1)
    80005c40:	0097b023          	sd	s1,0(a5)
    80005c44:	00813483          	ld	s1,8(sp)
    80005c48:	02010113          	addi	sp,sp,32
    80005c4c:	00008067          	ret
    80005c50:	00001517          	auipc	a0,0x1
    80005c54:	68050513          	addi	a0,a0,1664 # 800072d0 <digits+0x18>
    80005c58:	fffff097          	auipc	ra,0xfffff
    80005c5c:	354080e7          	jalr	852(ra) # 80004fac <panic>

0000000080005c60 <kalloc>:
    80005c60:	fe010113          	addi	sp,sp,-32
    80005c64:	00813823          	sd	s0,16(sp)
    80005c68:	00913423          	sd	s1,8(sp)
    80005c6c:	00113c23          	sd	ra,24(sp)
    80005c70:	02010413          	addi	s0,sp,32
    80005c74:	00003797          	auipc	a5,0x3
    80005c78:	d4c78793          	addi	a5,a5,-692 # 800089c0 <kmem>
    80005c7c:	0007b483          	ld	s1,0(a5)
    80005c80:	02048063          	beqz	s1,80005ca0 <kalloc+0x40>
    80005c84:	0004b703          	ld	a4,0(s1)
    80005c88:	00001637          	lui	a2,0x1
    80005c8c:	00500593          	li	a1,5
    80005c90:	00048513          	mv	a0,s1
    80005c94:	00e7b023          	sd	a4,0(a5)
    80005c98:	00000097          	auipc	ra,0x0
    80005c9c:	400080e7          	jalr	1024(ra) # 80006098 <__memset>
    80005ca0:	01813083          	ld	ra,24(sp)
    80005ca4:	01013403          	ld	s0,16(sp)
    80005ca8:	00048513          	mv	a0,s1
    80005cac:	00813483          	ld	s1,8(sp)
    80005cb0:	02010113          	addi	sp,sp,32
    80005cb4:	00008067          	ret

0000000080005cb8 <initlock>:
    80005cb8:	ff010113          	addi	sp,sp,-16
    80005cbc:	00813423          	sd	s0,8(sp)
    80005cc0:	01010413          	addi	s0,sp,16
    80005cc4:	00813403          	ld	s0,8(sp)
    80005cc8:	00b53423          	sd	a1,8(a0)
    80005ccc:	00052023          	sw	zero,0(a0)
    80005cd0:	00053823          	sd	zero,16(a0)
    80005cd4:	01010113          	addi	sp,sp,16
    80005cd8:	00008067          	ret

0000000080005cdc <acquire>:
    80005cdc:	fe010113          	addi	sp,sp,-32
    80005ce0:	00813823          	sd	s0,16(sp)
    80005ce4:	00913423          	sd	s1,8(sp)
    80005ce8:	00113c23          	sd	ra,24(sp)
    80005cec:	01213023          	sd	s2,0(sp)
    80005cf0:	02010413          	addi	s0,sp,32
    80005cf4:	00050493          	mv	s1,a0
    80005cf8:	10002973          	csrr	s2,sstatus
    80005cfc:	100027f3          	csrr	a5,sstatus
    80005d00:	ffd7f793          	andi	a5,a5,-3
    80005d04:	10079073          	csrw	sstatus,a5
    80005d08:	fffff097          	auipc	ra,0xfffff
    80005d0c:	8ec080e7          	jalr	-1812(ra) # 800045f4 <mycpu>
    80005d10:	07852783          	lw	a5,120(a0)
    80005d14:	06078e63          	beqz	a5,80005d90 <acquire+0xb4>
    80005d18:	fffff097          	auipc	ra,0xfffff
    80005d1c:	8dc080e7          	jalr	-1828(ra) # 800045f4 <mycpu>
    80005d20:	07852783          	lw	a5,120(a0)
    80005d24:	0004a703          	lw	a4,0(s1)
    80005d28:	0017879b          	addiw	a5,a5,1
    80005d2c:	06f52c23          	sw	a5,120(a0)
    80005d30:	04071063          	bnez	a4,80005d70 <acquire+0x94>
    80005d34:	00100713          	li	a4,1
    80005d38:	00070793          	mv	a5,a4
    80005d3c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005d40:	0007879b          	sext.w	a5,a5
    80005d44:	fe079ae3          	bnez	a5,80005d38 <acquire+0x5c>
    80005d48:	0ff0000f          	fence
    80005d4c:	fffff097          	auipc	ra,0xfffff
    80005d50:	8a8080e7          	jalr	-1880(ra) # 800045f4 <mycpu>
    80005d54:	01813083          	ld	ra,24(sp)
    80005d58:	01013403          	ld	s0,16(sp)
    80005d5c:	00a4b823          	sd	a0,16(s1)
    80005d60:	00013903          	ld	s2,0(sp)
    80005d64:	00813483          	ld	s1,8(sp)
    80005d68:	02010113          	addi	sp,sp,32
    80005d6c:	00008067          	ret
    80005d70:	0104b903          	ld	s2,16(s1)
    80005d74:	fffff097          	auipc	ra,0xfffff
    80005d78:	880080e7          	jalr	-1920(ra) # 800045f4 <mycpu>
    80005d7c:	faa91ce3          	bne	s2,a0,80005d34 <acquire+0x58>
    80005d80:	00001517          	auipc	a0,0x1
    80005d84:	55850513          	addi	a0,a0,1368 # 800072d8 <digits+0x20>
    80005d88:	fffff097          	auipc	ra,0xfffff
    80005d8c:	224080e7          	jalr	548(ra) # 80004fac <panic>
    80005d90:	00195913          	srli	s2,s2,0x1
    80005d94:	fffff097          	auipc	ra,0xfffff
    80005d98:	860080e7          	jalr	-1952(ra) # 800045f4 <mycpu>
    80005d9c:	00197913          	andi	s2,s2,1
    80005da0:	07252e23          	sw	s2,124(a0)
    80005da4:	f75ff06f          	j	80005d18 <acquire+0x3c>

0000000080005da8 <release>:
    80005da8:	fe010113          	addi	sp,sp,-32
    80005dac:	00813823          	sd	s0,16(sp)
    80005db0:	00113c23          	sd	ra,24(sp)
    80005db4:	00913423          	sd	s1,8(sp)
    80005db8:	01213023          	sd	s2,0(sp)
    80005dbc:	02010413          	addi	s0,sp,32
    80005dc0:	00052783          	lw	a5,0(a0)
    80005dc4:	00079a63          	bnez	a5,80005dd8 <release+0x30>
    80005dc8:	00001517          	auipc	a0,0x1
    80005dcc:	51850513          	addi	a0,a0,1304 # 800072e0 <digits+0x28>
    80005dd0:	fffff097          	auipc	ra,0xfffff
    80005dd4:	1dc080e7          	jalr	476(ra) # 80004fac <panic>
    80005dd8:	01053903          	ld	s2,16(a0)
    80005ddc:	00050493          	mv	s1,a0
    80005de0:	fffff097          	auipc	ra,0xfffff
    80005de4:	814080e7          	jalr	-2028(ra) # 800045f4 <mycpu>
    80005de8:	fea910e3          	bne	s2,a0,80005dc8 <release+0x20>
    80005dec:	0004b823          	sd	zero,16(s1)
    80005df0:	0ff0000f          	fence
    80005df4:	0f50000f          	fence	iorw,ow
    80005df8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80005dfc:	ffffe097          	auipc	ra,0xffffe
    80005e00:	7f8080e7          	jalr	2040(ra) # 800045f4 <mycpu>
    80005e04:	100027f3          	csrr	a5,sstatus
    80005e08:	0027f793          	andi	a5,a5,2
    80005e0c:	04079a63          	bnez	a5,80005e60 <release+0xb8>
    80005e10:	07852783          	lw	a5,120(a0)
    80005e14:	02f05e63          	blez	a5,80005e50 <release+0xa8>
    80005e18:	fff7871b          	addiw	a4,a5,-1
    80005e1c:	06e52c23          	sw	a4,120(a0)
    80005e20:	00071c63          	bnez	a4,80005e38 <release+0x90>
    80005e24:	07c52783          	lw	a5,124(a0)
    80005e28:	00078863          	beqz	a5,80005e38 <release+0x90>
    80005e2c:	100027f3          	csrr	a5,sstatus
    80005e30:	0027e793          	ori	a5,a5,2
    80005e34:	10079073          	csrw	sstatus,a5
    80005e38:	01813083          	ld	ra,24(sp)
    80005e3c:	01013403          	ld	s0,16(sp)
    80005e40:	00813483          	ld	s1,8(sp)
    80005e44:	00013903          	ld	s2,0(sp)
    80005e48:	02010113          	addi	sp,sp,32
    80005e4c:	00008067          	ret
    80005e50:	00001517          	auipc	a0,0x1
    80005e54:	4b050513          	addi	a0,a0,1200 # 80007300 <digits+0x48>
    80005e58:	fffff097          	auipc	ra,0xfffff
    80005e5c:	154080e7          	jalr	340(ra) # 80004fac <panic>
    80005e60:	00001517          	auipc	a0,0x1
    80005e64:	48850513          	addi	a0,a0,1160 # 800072e8 <digits+0x30>
    80005e68:	fffff097          	auipc	ra,0xfffff
    80005e6c:	144080e7          	jalr	324(ra) # 80004fac <panic>

0000000080005e70 <holding>:
    80005e70:	00052783          	lw	a5,0(a0)
    80005e74:	00079663          	bnez	a5,80005e80 <holding+0x10>
    80005e78:	00000513          	li	a0,0
    80005e7c:	00008067          	ret
    80005e80:	fe010113          	addi	sp,sp,-32
    80005e84:	00813823          	sd	s0,16(sp)
    80005e88:	00913423          	sd	s1,8(sp)
    80005e8c:	00113c23          	sd	ra,24(sp)
    80005e90:	02010413          	addi	s0,sp,32
    80005e94:	01053483          	ld	s1,16(a0)
    80005e98:	ffffe097          	auipc	ra,0xffffe
    80005e9c:	75c080e7          	jalr	1884(ra) # 800045f4 <mycpu>
    80005ea0:	01813083          	ld	ra,24(sp)
    80005ea4:	01013403          	ld	s0,16(sp)
    80005ea8:	40a48533          	sub	a0,s1,a0
    80005eac:	00153513          	seqz	a0,a0
    80005eb0:	00813483          	ld	s1,8(sp)
    80005eb4:	02010113          	addi	sp,sp,32
    80005eb8:	00008067          	ret

0000000080005ebc <push_off>:
    80005ebc:	fe010113          	addi	sp,sp,-32
    80005ec0:	00813823          	sd	s0,16(sp)
    80005ec4:	00113c23          	sd	ra,24(sp)
    80005ec8:	00913423          	sd	s1,8(sp)
    80005ecc:	02010413          	addi	s0,sp,32
    80005ed0:	100024f3          	csrr	s1,sstatus
    80005ed4:	100027f3          	csrr	a5,sstatus
    80005ed8:	ffd7f793          	andi	a5,a5,-3
    80005edc:	10079073          	csrw	sstatus,a5
    80005ee0:	ffffe097          	auipc	ra,0xffffe
    80005ee4:	714080e7          	jalr	1812(ra) # 800045f4 <mycpu>
    80005ee8:	07852783          	lw	a5,120(a0)
    80005eec:	02078663          	beqz	a5,80005f18 <push_off+0x5c>
    80005ef0:	ffffe097          	auipc	ra,0xffffe
    80005ef4:	704080e7          	jalr	1796(ra) # 800045f4 <mycpu>
    80005ef8:	07852783          	lw	a5,120(a0)
    80005efc:	01813083          	ld	ra,24(sp)
    80005f00:	01013403          	ld	s0,16(sp)
    80005f04:	0017879b          	addiw	a5,a5,1
    80005f08:	06f52c23          	sw	a5,120(a0)
    80005f0c:	00813483          	ld	s1,8(sp)
    80005f10:	02010113          	addi	sp,sp,32
    80005f14:	00008067          	ret
    80005f18:	0014d493          	srli	s1,s1,0x1
    80005f1c:	ffffe097          	auipc	ra,0xffffe
    80005f20:	6d8080e7          	jalr	1752(ra) # 800045f4 <mycpu>
    80005f24:	0014f493          	andi	s1,s1,1
    80005f28:	06952e23          	sw	s1,124(a0)
    80005f2c:	fc5ff06f          	j	80005ef0 <push_off+0x34>

0000000080005f30 <pop_off>:
    80005f30:	ff010113          	addi	sp,sp,-16
    80005f34:	00813023          	sd	s0,0(sp)
    80005f38:	00113423          	sd	ra,8(sp)
    80005f3c:	01010413          	addi	s0,sp,16
    80005f40:	ffffe097          	auipc	ra,0xffffe
    80005f44:	6b4080e7          	jalr	1716(ra) # 800045f4 <mycpu>
    80005f48:	100027f3          	csrr	a5,sstatus
    80005f4c:	0027f793          	andi	a5,a5,2
    80005f50:	04079663          	bnez	a5,80005f9c <pop_off+0x6c>
    80005f54:	07852783          	lw	a5,120(a0)
    80005f58:	02f05a63          	blez	a5,80005f8c <pop_off+0x5c>
    80005f5c:	fff7871b          	addiw	a4,a5,-1
    80005f60:	06e52c23          	sw	a4,120(a0)
    80005f64:	00071c63          	bnez	a4,80005f7c <pop_off+0x4c>
    80005f68:	07c52783          	lw	a5,124(a0)
    80005f6c:	00078863          	beqz	a5,80005f7c <pop_off+0x4c>
    80005f70:	100027f3          	csrr	a5,sstatus
    80005f74:	0027e793          	ori	a5,a5,2
    80005f78:	10079073          	csrw	sstatus,a5
    80005f7c:	00813083          	ld	ra,8(sp)
    80005f80:	00013403          	ld	s0,0(sp)
    80005f84:	01010113          	addi	sp,sp,16
    80005f88:	00008067          	ret
    80005f8c:	00001517          	auipc	a0,0x1
    80005f90:	37450513          	addi	a0,a0,884 # 80007300 <digits+0x48>
    80005f94:	fffff097          	auipc	ra,0xfffff
    80005f98:	018080e7          	jalr	24(ra) # 80004fac <panic>
    80005f9c:	00001517          	auipc	a0,0x1
    80005fa0:	34c50513          	addi	a0,a0,844 # 800072e8 <digits+0x30>
    80005fa4:	fffff097          	auipc	ra,0xfffff
    80005fa8:	008080e7          	jalr	8(ra) # 80004fac <panic>

0000000080005fac <push_on>:
    80005fac:	fe010113          	addi	sp,sp,-32
    80005fb0:	00813823          	sd	s0,16(sp)
    80005fb4:	00113c23          	sd	ra,24(sp)
    80005fb8:	00913423          	sd	s1,8(sp)
    80005fbc:	02010413          	addi	s0,sp,32
    80005fc0:	100024f3          	csrr	s1,sstatus
    80005fc4:	100027f3          	csrr	a5,sstatus
    80005fc8:	0027e793          	ori	a5,a5,2
    80005fcc:	10079073          	csrw	sstatus,a5
    80005fd0:	ffffe097          	auipc	ra,0xffffe
    80005fd4:	624080e7          	jalr	1572(ra) # 800045f4 <mycpu>
    80005fd8:	07852783          	lw	a5,120(a0)
    80005fdc:	02078663          	beqz	a5,80006008 <push_on+0x5c>
    80005fe0:	ffffe097          	auipc	ra,0xffffe
    80005fe4:	614080e7          	jalr	1556(ra) # 800045f4 <mycpu>
    80005fe8:	07852783          	lw	a5,120(a0)
    80005fec:	01813083          	ld	ra,24(sp)
    80005ff0:	01013403          	ld	s0,16(sp)
    80005ff4:	0017879b          	addiw	a5,a5,1
    80005ff8:	06f52c23          	sw	a5,120(a0)
    80005ffc:	00813483          	ld	s1,8(sp)
    80006000:	02010113          	addi	sp,sp,32
    80006004:	00008067          	ret
    80006008:	0014d493          	srli	s1,s1,0x1
    8000600c:	ffffe097          	auipc	ra,0xffffe
    80006010:	5e8080e7          	jalr	1512(ra) # 800045f4 <mycpu>
    80006014:	0014f493          	andi	s1,s1,1
    80006018:	06952e23          	sw	s1,124(a0)
    8000601c:	fc5ff06f          	j	80005fe0 <push_on+0x34>

0000000080006020 <pop_on>:
    80006020:	ff010113          	addi	sp,sp,-16
    80006024:	00813023          	sd	s0,0(sp)
    80006028:	00113423          	sd	ra,8(sp)
    8000602c:	01010413          	addi	s0,sp,16
    80006030:	ffffe097          	auipc	ra,0xffffe
    80006034:	5c4080e7          	jalr	1476(ra) # 800045f4 <mycpu>
    80006038:	100027f3          	csrr	a5,sstatus
    8000603c:	0027f793          	andi	a5,a5,2
    80006040:	04078463          	beqz	a5,80006088 <pop_on+0x68>
    80006044:	07852783          	lw	a5,120(a0)
    80006048:	02f05863          	blez	a5,80006078 <pop_on+0x58>
    8000604c:	fff7879b          	addiw	a5,a5,-1
    80006050:	06f52c23          	sw	a5,120(a0)
    80006054:	07853783          	ld	a5,120(a0)
    80006058:	00079863          	bnez	a5,80006068 <pop_on+0x48>
    8000605c:	100027f3          	csrr	a5,sstatus
    80006060:	ffd7f793          	andi	a5,a5,-3
    80006064:	10079073          	csrw	sstatus,a5
    80006068:	00813083          	ld	ra,8(sp)
    8000606c:	00013403          	ld	s0,0(sp)
    80006070:	01010113          	addi	sp,sp,16
    80006074:	00008067          	ret
    80006078:	00001517          	auipc	a0,0x1
    8000607c:	2b050513          	addi	a0,a0,688 # 80007328 <digits+0x70>
    80006080:	fffff097          	auipc	ra,0xfffff
    80006084:	f2c080e7          	jalr	-212(ra) # 80004fac <panic>
    80006088:	00001517          	auipc	a0,0x1
    8000608c:	28050513          	addi	a0,a0,640 # 80007308 <digits+0x50>
    80006090:	fffff097          	auipc	ra,0xfffff
    80006094:	f1c080e7          	jalr	-228(ra) # 80004fac <panic>

0000000080006098 <__memset>:
    80006098:	ff010113          	addi	sp,sp,-16
    8000609c:	00813423          	sd	s0,8(sp)
    800060a0:	01010413          	addi	s0,sp,16
    800060a4:	1a060e63          	beqz	a2,80006260 <__memset+0x1c8>
    800060a8:	40a007b3          	neg	a5,a0
    800060ac:	0077f793          	andi	a5,a5,7
    800060b0:	00778693          	addi	a3,a5,7
    800060b4:	00b00813          	li	a6,11
    800060b8:	0ff5f593          	andi	a1,a1,255
    800060bc:	fff6071b          	addiw	a4,a2,-1
    800060c0:	1b06e663          	bltu	a3,a6,8000626c <__memset+0x1d4>
    800060c4:	1cd76463          	bltu	a4,a3,8000628c <__memset+0x1f4>
    800060c8:	1a078e63          	beqz	a5,80006284 <__memset+0x1ec>
    800060cc:	00b50023          	sb	a1,0(a0)
    800060d0:	00100713          	li	a4,1
    800060d4:	1ae78463          	beq	a5,a4,8000627c <__memset+0x1e4>
    800060d8:	00b500a3          	sb	a1,1(a0)
    800060dc:	00200713          	li	a4,2
    800060e0:	1ae78a63          	beq	a5,a4,80006294 <__memset+0x1fc>
    800060e4:	00b50123          	sb	a1,2(a0)
    800060e8:	00300713          	li	a4,3
    800060ec:	18e78463          	beq	a5,a4,80006274 <__memset+0x1dc>
    800060f0:	00b501a3          	sb	a1,3(a0)
    800060f4:	00400713          	li	a4,4
    800060f8:	1ae78263          	beq	a5,a4,8000629c <__memset+0x204>
    800060fc:	00b50223          	sb	a1,4(a0)
    80006100:	00500713          	li	a4,5
    80006104:	1ae78063          	beq	a5,a4,800062a4 <__memset+0x20c>
    80006108:	00b502a3          	sb	a1,5(a0)
    8000610c:	00700713          	li	a4,7
    80006110:	18e79e63          	bne	a5,a4,800062ac <__memset+0x214>
    80006114:	00b50323          	sb	a1,6(a0)
    80006118:	00700e93          	li	t4,7
    8000611c:	00859713          	slli	a4,a1,0x8
    80006120:	00e5e733          	or	a4,a1,a4
    80006124:	01059e13          	slli	t3,a1,0x10
    80006128:	01c76e33          	or	t3,a4,t3
    8000612c:	01859313          	slli	t1,a1,0x18
    80006130:	006e6333          	or	t1,t3,t1
    80006134:	02059893          	slli	a7,a1,0x20
    80006138:	40f60e3b          	subw	t3,a2,a5
    8000613c:	011368b3          	or	a7,t1,a7
    80006140:	02859813          	slli	a6,a1,0x28
    80006144:	0108e833          	or	a6,a7,a6
    80006148:	03059693          	slli	a3,a1,0x30
    8000614c:	003e589b          	srliw	a7,t3,0x3
    80006150:	00d866b3          	or	a3,a6,a3
    80006154:	03859713          	slli	a4,a1,0x38
    80006158:	00389813          	slli	a6,a7,0x3
    8000615c:	00f507b3          	add	a5,a0,a5
    80006160:	00e6e733          	or	a4,a3,a4
    80006164:	000e089b          	sext.w	a7,t3
    80006168:	00f806b3          	add	a3,a6,a5
    8000616c:	00e7b023          	sd	a4,0(a5)
    80006170:	00878793          	addi	a5,a5,8
    80006174:	fed79ce3          	bne	a5,a3,8000616c <__memset+0xd4>
    80006178:	ff8e7793          	andi	a5,t3,-8
    8000617c:	0007871b          	sext.w	a4,a5
    80006180:	01d787bb          	addw	a5,a5,t4
    80006184:	0ce88e63          	beq	a7,a4,80006260 <__memset+0x1c8>
    80006188:	00f50733          	add	a4,a0,a5
    8000618c:	00b70023          	sb	a1,0(a4)
    80006190:	0017871b          	addiw	a4,a5,1
    80006194:	0cc77663          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    80006198:	00e50733          	add	a4,a0,a4
    8000619c:	00b70023          	sb	a1,0(a4)
    800061a0:	0027871b          	addiw	a4,a5,2
    800061a4:	0ac77e63          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    800061a8:	00e50733          	add	a4,a0,a4
    800061ac:	00b70023          	sb	a1,0(a4)
    800061b0:	0037871b          	addiw	a4,a5,3
    800061b4:	0ac77663          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    800061b8:	00e50733          	add	a4,a0,a4
    800061bc:	00b70023          	sb	a1,0(a4)
    800061c0:	0047871b          	addiw	a4,a5,4
    800061c4:	08c77e63          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    800061c8:	00e50733          	add	a4,a0,a4
    800061cc:	00b70023          	sb	a1,0(a4)
    800061d0:	0057871b          	addiw	a4,a5,5
    800061d4:	08c77663          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    800061d8:	00e50733          	add	a4,a0,a4
    800061dc:	00b70023          	sb	a1,0(a4)
    800061e0:	0067871b          	addiw	a4,a5,6
    800061e4:	06c77e63          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    800061e8:	00e50733          	add	a4,a0,a4
    800061ec:	00b70023          	sb	a1,0(a4)
    800061f0:	0077871b          	addiw	a4,a5,7
    800061f4:	06c77663          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    800061f8:	00e50733          	add	a4,a0,a4
    800061fc:	00b70023          	sb	a1,0(a4)
    80006200:	0087871b          	addiw	a4,a5,8
    80006204:	04c77e63          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    80006208:	00e50733          	add	a4,a0,a4
    8000620c:	00b70023          	sb	a1,0(a4)
    80006210:	0097871b          	addiw	a4,a5,9
    80006214:	04c77663          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    80006218:	00e50733          	add	a4,a0,a4
    8000621c:	00b70023          	sb	a1,0(a4)
    80006220:	00a7871b          	addiw	a4,a5,10
    80006224:	02c77e63          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    80006228:	00e50733          	add	a4,a0,a4
    8000622c:	00b70023          	sb	a1,0(a4)
    80006230:	00b7871b          	addiw	a4,a5,11
    80006234:	02c77663          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    80006238:	00e50733          	add	a4,a0,a4
    8000623c:	00b70023          	sb	a1,0(a4)
    80006240:	00c7871b          	addiw	a4,a5,12
    80006244:	00c77e63          	bgeu	a4,a2,80006260 <__memset+0x1c8>
    80006248:	00e50733          	add	a4,a0,a4
    8000624c:	00b70023          	sb	a1,0(a4)
    80006250:	00d7879b          	addiw	a5,a5,13
    80006254:	00c7f663          	bgeu	a5,a2,80006260 <__memset+0x1c8>
    80006258:	00f507b3          	add	a5,a0,a5
    8000625c:	00b78023          	sb	a1,0(a5)
    80006260:	00813403          	ld	s0,8(sp)
    80006264:	01010113          	addi	sp,sp,16
    80006268:	00008067          	ret
    8000626c:	00b00693          	li	a3,11
    80006270:	e55ff06f          	j	800060c4 <__memset+0x2c>
    80006274:	00300e93          	li	t4,3
    80006278:	ea5ff06f          	j	8000611c <__memset+0x84>
    8000627c:	00100e93          	li	t4,1
    80006280:	e9dff06f          	j	8000611c <__memset+0x84>
    80006284:	00000e93          	li	t4,0
    80006288:	e95ff06f          	j	8000611c <__memset+0x84>
    8000628c:	00000793          	li	a5,0
    80006290:	ef9ff06f          	j	80006188 <__memset+0xf0>
    80006294:	00200e93          	li	t4,2
    80006298:	e85ff06f          	j	8000611c <__memset+0x84>
    8000629c:	00400e93          	li	t4,4
    800062a0:	e7dff06f          	j	8000611c <__memset+0x84>
    800062a4:	00500e93          	li	t4,5
    800062a8:	e75ff06f          	j	8000611c <__memset+0x84>
    800062ac:	00600e93          	li	t4,6
    800062b0:	e6dff06f          	j	8000611c <__memset+0x84>

00000000800062b4 <__memmove>:
    800062b4:	ff010113          	addi	sp,sp,-16
    800062b8:	00813423          	sd	s0,8(sp)
    800062bc:	01010413          	addi	s0,sp,16
    800062c0:	0e060863          	beqz	a2,800063b0 <__memmove+0xfc>
    800062c4:	fff6069b          	addiw	a3,a2,-1
    800062c8:	0006881b          	sext.w	a6,a3
    800062cc:	0ea5e863          	bltu	a1,a0,800063bc <__memmove+0x108>
    800062d0:	00758713          	addi	a4,a1,7
    800062d4:	00a5e7b3          	or	a5,a1,a0
    800062d8:	40a70733          	sub	a4,a4,a0
    800062dc:	0077f793          	andi	a5,a5,7
    800062e0:	00f73713          	sltiu	a4,a4,15
    800062e4:	00174713          	xori	a4,a4,1
    800062e8:	0017b793          	seqz	a5,a5
    800062ec:	00e7f7b3          	and	a5,a5,a4
    800062f0:	10078863          	beqz	a5,80006400 <__memmove+0x14c>
    800062f4:	00900793          	li	a5,9
    800062f8:	1107f463          	bgeu	a5,a6,80006400 <__memmove+0x14c>
    800062fc:	0036581b          	srliw	a6,a2,0x3
    80006300:	fff8081b          	addiw	a6,a6,-1
    80006304:	02081813          	slli	a6,a6,0x20
    80006308:	01d85893          	srli	a7,a6,0x1d
    8000630c:	00858813          	addi	a6,a1,8
    80006310:	00058793          	mv	a5,a1
    80006314:	00050713          	mv	a4,a0
    80006318:	01088833          	add	a6,a7,a6
    8000631c:	0007b883          	ld	a7,0(a5)
    80006320:	00878793          	addi	a5,a5,8
    80006324:	00870713          	addi	a4,a4,8
    80006328:	ff173c23          	sd	a7,-8(a4)
    8000632c:	ff0798e3          	bne	a5,a6,8000631c <__memmove+0x68>
    80006330:	ff867713          	andi	a4,a2,-8
    80006334:	02071793          	slli	a5,a4,0x20
    80006338:	0207d793          	srli	a5,a5,0x20
    8000633c:	00f585b3          	add	a1,a1,a5
    80006340:	40e686bb          	subw	a3,a3,a4
    80006344:	00f507b3          	add	a5,a0,a5
    80006348:	06e60463          	beq	a2,a4,800063b0 <__memmove+0xfc>
    8000634c:	0005c703          	lbu	a4,0(a1)
    80006350:	00e78023          	sb	a4,0(a5)
    80006354:	04068e63          	beqz	a3,800063b0 <__memmove+0xfc>
    80006358:	0015c603          	lbu	a2,1(a1)
    8000635c:	00100713          	li	a4,1
    80006360:	00c780a3          	sb	a2,1(a5)
    80006364:	04e68663          	beq	a3,a4,800063b0 <__memmove+0xfc>
    80006368:	0025c603          	lbu	a2,2(a1)
    8000636c:	00200713          	li	a4,2
    80006370:	00c78123          	sb	a2,2(a5)
    80006374:	02e68e63          	beq	a3,a4,800063b0 <__memmove+0xfc>
    80006378:	0035c603          	lbu	a2,3(a1)
    8000637c:	00300713          	li	a4,3
    80006380:	00c781a3          	sb	a2,3(a5)
    80006384:	02e68663          	beq	a3,a4,800063b0 <__memmove+0xfc>
    80006388:	0045c603          	lbu	a2,4(a1)
    8000638c:	00400713          	li	a4,4
    80006390:	00c78223          	sb	a2,4(a5)
    80006394:	00e68e63          	beq	a3,a4,800063b0 <__memmove+0xfc>
    80006398:	0055c603          	lbu	a2,5(a1)
    8000639c:	00500713          	li	a4,5
    800063a0:	00c782a3          	sb	a2,5(a5)
    800063a4:	00e68663          	beq	a3,a4,800063b0 <__memmove+0xfc>
    800063a8:	0065c703          	lbu	a4,6(a1)
    800063ac:	00e78323          	sb	a4,6(a5)
    800063b0:	00813403          	ld	s0,8(sp)
    800063b4:	01010113          	addi	sp,sp,16
    800063b8:	00008067          	ret
    800063bc:	02061713          	slli	a4,a2,0x20
    800063c0:	02075713          	srli	a4,a4,0x20
    800063c4:	00e587b3          	add	a5,a1,a4
    800063c8:	f0f574e3          	bgeu	a0,a5,800062d0 <__memmove+0x1c>
    800063cc:	02069613          	slli	a2,a3,0x20
    800063d0:	02065613          	srli	a2,a2,0x20
    800063d4:	fff64613          	not	a2,a2
    800063d8:	00e50733          	add	a4,a0,a4
    800063dc:	00c78633          	add	a2,a5,a2
    800063e0:	fff7c683          	lbu	a3,-1(a5)
    800063e4:	fff78793          	addi	a5,a5,-1
    800063e8:	fff70713          	addi	a4,a4,-1
    800063ec:	00d70023          	sb	a3,0(a4)
    800063f0:	fec798e3          	bne	a5,a2,800063e0 <__memmove+0x12c>
    800063f4:	00813403          	ld	s0,8(sp)
    800063f8:	01010113          	addi	sp,sp,16
    800063fc:	00008067          	ret
    80006400:	02069713          	slli	a4,a3,0x20
    80006404:	02075713          	srli	a4,a4,0x20
    80006408:	00170713          	addi	a4,a4,1
    8000640c:	00e50733          	add	a4,a0,a4
    80006410:	00050793          	mv	a5,a0
    80006414:	0005c683          	lbu	a3,0(a1)
    80006418:	00178793          	addi	a5,a5,1
    8000641c:	00158593          	addi	a1,a1,1
    80006420:	fed78fa3          	sb	a3,-1(a5)
    80006424:	fee798e3          	bne	a5,a4,80006414 <__memmove+0x160>
    80006428:	f89ff06f          	j	800063b0 <__memmove+0xfc>
	...
