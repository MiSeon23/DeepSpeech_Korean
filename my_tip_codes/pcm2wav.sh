#!/bin/bash

echo "START"

# Find all .pcm files and convert them to the wave format.
for input_file in $(find /home/kusw-07/deepspeech_ws/src/DeepSpeech/data/PCM_data/002.노인남녀/*/ -name "*.PCM")
do
  echo "CONVERTINE FILE : ${input_file}"
  filename=$(basename "$input_file")
  filename=${filename%.*}
  output_file=$filename.wav  
# output_file=`echo $input_file | sed 's/\//-/g' | sed 's/\.-//g' | sed 's/\.pcm/\.wav/g'`
  ffmpeg -v quiet -f s16le -ar 16k -ac 1 -i $input_file $output_file
done

echo "DONE"
