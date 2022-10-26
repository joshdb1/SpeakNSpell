# SpeakNSpell

This project implements the basic functionality of TI's Speak & Spell toy introduced in 1978. My S&S only implements the vowel sounds (short and long A, E, I, O, U). I plan to add consonants in the future because those require different signal processing techniques.

The S&S synthesizes speech using filters generated from an autocorrelation of a speech signal. The filters are then convolved with a periodic impulse train to get a synthesized vowel audio signal.

Running `genFilters.m` will create a filter for every audio signal in the `audio` directory. Each resulting audio signal will then play. 

This project demonstrates my understanding of correlation, filtering, and using efficient methods to solve equations (see `Toepsolve.m` where I solve Yule-Walker equations using a Toeplitz matrix).
