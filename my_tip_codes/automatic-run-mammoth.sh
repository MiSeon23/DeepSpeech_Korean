#!/bin/bash

echo "START"
echo "[ downlaod required python package ]"

pip3 install deepspeech

echo "[ ready to convert ]"
mkdir -p wav
# convert all .pcm to .wav
for input_file in $(find ./$1/*/ -name "*.PCM")
do
  # echo "CONVERTING FILE : ${input_file}"
  filename=$(basename "$input_file")
  filename=${filename%.*}
  output_file=$filename.wav
  ffmpeg -v quiet -f s16le -ar 16k -ac 1 -i $input_file ./wav/$output_file
done

echo "Done Converting\n Finish Testing in a second"

for test_file in $(find ./wav/ -name "*.wav")
do
  deepspeech --model output_graph.pbmm --audio $test_file >> ./인식결과1.txt
done

echo "Done Testing. Thank You."
