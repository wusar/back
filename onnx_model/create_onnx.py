import torch

class Model(torch.nn.Module):
    def __init__(self):
        super(Model, self).__init__()
        self.weights = torch.randn(1,1,1,1)
        self.bias = torch.randn(1)

    def forward(self, x):
        
        return torch.matmul(x, self.weights) + self.bias

x = torch.randn(1,1,1,1)   # 生成张量

model = Model()

export_onnx_file = "test.onnx"		# 目的ONNX文件名

torch.onnx.export(model,
                    x,
                    export_onnx_file,
                    opset_version=10,
                    input_names=["input"],	# 输入名
                    output_names=["output"],	# 输出名
                    verbose=True)	# 是否打印信息