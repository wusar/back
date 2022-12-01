
// pseudo code on GPU 0
{
    matrix A, B, C, C_recv;
    matmul(C,A,B);
    send_to_GPU_1(C);
    recv_from_GPU_1(C_recv);
    Add(C,C_recv);
}


// pseudo code on GPU 1
{
    matrix A, B, C, C_recv;
    matmul(C,A,B);
    send_to_GPU_0(C);
    recv_from_GPU_0(C_recv);
    Add(C,C_recv);
}


