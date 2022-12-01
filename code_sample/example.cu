
void opseq(int tile_id)
{
    op_0_matmul(tile_id);
    //wait for the recvbuf on gpu1 to be ready
    while(flag1[tile_id] == 1);
    op_copy_kernel(tile_id);
    flag1[tile_id]=1;
    //wait for the recved data on gpu0 to be ready
    while (flag0[tile_id] == 0);
    op_add(tile_id);
    //reset the flag to enable the next iteration
    flag0[tile_id]=0;
    op_scale(tile_id);
}
__device__ main()
{
    global_sync();
    if (blockIdx.x < 80) {
        if (threadIdx.x < 160) {
            opseq(5 * blockIdx.x + threadIdx.x / 32);
        }
    }
    if (blockIdx.x >= 80 && blockIdx.x < 108) {
        if (threadIdx.x < 128) {
            opseq(4 * (blockIdx.x - 80) + threadIdx.x / 32 +400);
        }
    }
}