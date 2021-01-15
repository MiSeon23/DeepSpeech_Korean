# How to edit DeepSpeech to each langauge

## [ what to install ]

```
pip3 install deepspeech
pip3 install deepspeech-gpu
```

## [ how to prepare data & what to change ]

1. It should be a .wav audio file

2. Create data/test_data.csv, train_data.csv and validate_data file.

Those files should have wav_filename and transcript column.

3. Create data/unique_alphabet.txt by your langauge.

4. Change the number of alphabet from training/deepspeech_training/util/config.py line 119

```
c.n_hidden_6={the number you want}
```

## [ training ]

You can use bash file.

e.g.

```
./bin/run-mammoth.sh
```

## [ test ]

1. change .pb to .pbmm

```
( the first time )
python3 util/taskcluster.py --source tensorflow --artifact convert_graphdef_memmapped_format --branch r1.15 --target .

( every time when you finish the model )
./convert_graphdef_memmapped_format --in_graph=./data/output_graph.pb --out_graph=./data/output_graph.pbmm
```

2. test

```
deepspeech --model ./data/output_graph.pbmm --audio ./data/{audio_name}.wav

or

./deepspeech --model ./data/output_graph.pbmm --audio ./data/{audio_name}.wav
```
