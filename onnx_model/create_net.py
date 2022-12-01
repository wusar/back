import torch 
import onnx
class Model(torch.nn.Module): 
 
    def __init__(self): 
        super().__init__() 
        self.weight = torch.nn.Parameter(torch.randn(1, 1, 10, 10))
        self.bias = torch.nn.Parameter(torch.randn(1, 1, 10, 10))
        
    def forward(self, x): 
        return torch.add(torch.matmul(self.weight, x), self.bias)
model = Model() 
input = torch.randn(1, 1, 10, 10)
 
torch.onnx.export(model, input, 'whole_model.onnx', verbose=True)
print('done') 
onnx_model = onnx.load('whole_model.onnx')
print(onnx_model.graph)