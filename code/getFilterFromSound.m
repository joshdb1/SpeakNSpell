function y = getFilterFromSound(filename)
    [~, soundFile, ~] = fileparts(filename);
%     filename = sprintf("%s.wav", soundFile);
    N = 15;
    a = audioread(filename);
    a = (sum(a, 2) / size(a, 2)).';

    lena = length(a);
    raa = conv(a, fliplr(a));
    r = raa(lena : lena + N);
    r = r.';

    %% Create and solve Yule-Walker equations (Toepsolve does this)
    filtcoeff = -toepsolve(r);
    filtcoeff = [1;  filtcoeff].';

    %% generate the periodic impulse signal
    % samples per second
    fs = 8000;

    % frequency in Hz
    F = 175;

    locs = linspace(0, 1 * fs, 1 * F);
    impulse = zeros(1 * fs, 1);
    locs = cast(round(locs + 1), 'int32');
    impulse(locs) = ones(1 * F,1);

    %% Filter the impulse response to get y
    y = filter(1, filtcoeff, impulse);

    %% Plot poles and zeros
    clf;zplane([], filtcoeff)
    title(sprintf("Pole Plot for %s", soundFile))
    print(sprintf("../figs/%s_polePlot.png", soundFile), '-dpng')

    %% Plot mag response
    N = 512;
    w = linspace(-pi, pi, N);
    h = abs((fft(filtcoeff, N)));
    clf;
    plot(w, abs(h))
    title(sprintf("Mag Response for %s", soundFile));
    print(sprintf("../figs/%s_magResponse.png", soundFile), '-dpng')
end