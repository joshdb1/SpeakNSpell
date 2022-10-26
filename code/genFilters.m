% get the audio file names
audioDir = "../audio/";
audioFiles = dir(fullfile(audioDir, "*.wav"));

yA = getFilterFromSound(fullfile(audioDir, "a_long.wav"));
ya = getFilterFromSound(fullfile(audioDir, "a_short.wav"));
yah = getFilterFromSound(fullfile(audioDir, "ah.wav"));
yE = getFilterFromSound(fullfile(audioDir, "e_long.wav"));
ye = getFilterFromSound(fullfile(audioDir, "e_short.wav"));
yI = getFilterFromSound(fullfile(audioDir, "i_long.wav"));
yi = getFilterFromSound(fullfile(audioDir, "i_short.wav"));
yO = getFilterFromSound(fullfile(audioDir, "o_long.wav"));
yo = getFilterFromSound(fullfile(audioDir, "o_short.wav"));
yU = getFilterFromSound(fullfile(audioDir, "u_long.wav"));
yu = getFilterFromSound(fullfile(audioDir, "u_short.wav"));

% play the synthesized vowels
sound([yA' ya' yah' yE' ye' yI' yi' yO' yo' yU' yu']);
