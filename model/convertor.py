
import onnx
from onnx_tf.backend import prepare
import tensorflow as tf
import torch
import numpy as np
from tensorflow import keras
from train import ConvNet
import warnings

warnings.filterwarnings("ignore")

device = (torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu'))

model_pytorch = ConvNet()
model_pytorch.load_state_dict(torch.load('checkpoint.pth'))

dummy_input = torch.from_numpy(np.random.randn(1,1,28,28)).float().to(device)
dummy_output = model_pytorch(dummy_input)
print(dummy_output)

# Export to ONNX format
torch.onnx.export(model_pytorch, dummy_input, 'signlanguage.onnx', input_names=['input'], output_names=['output'])

def convert_onnx_to_tf():
    #Load ONNX model and convert to tf format
    model_onnx = onnx.load('signlanguage.onnx')

    tf_rep = prepare(model_onnx)

    #Export model as .pb file
    tf_rep.export_graph('sign_language.pb')

def load_pb(path_to_pb):
    with tf.gfile.GFile(path_to_pb,'rb') as f:
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(f.read())
    with tf.Graph().as_default() as graph:
        tf.import_graph_def(graph_def,name='')
        return graph

def main():

    convert_onnx_to_tf()

    tf_graph = load_pb('sign_language.pb')
    sess = tf.Session(graph=tf_graph)

    # Show tensor names in graph
    for op in tf_graph.get_operations():
        print(op.values())

    input_tensor = tf_graph.get_tensor_by_name('input:0')
    output_tensor = tf_graph.get_tensor_by_name('add_6:0')
    
    output = sess.run(output_tensor, feed_dict={input_tensor: dummy_input})
    print(output)

    #Convert the model
    convertor = tf.compat.v1.lite.TFLiteConverter.from_frozen_graph('sign_language.pb',['input'],['add_6'])
    tflite_model = convertor.convert()

    #Save the model
    with open('sign_language.tflite','wb') as f:
        f.write(tflite_model)

if __name__ == '__main__':
    main()
