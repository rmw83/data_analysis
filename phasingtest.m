function phase = phasingtest(file)

m = load(file);
d = m.data(1);

d.phase = 0;
d = absorptive2dPP(d);

range1 = [2320, 2370];
range3 = [2250, 2450];
ind1 = find(d.w1>range1(1) & d.w1<range1(2));
ind3 = find(d.w3>range3(1) & d.w3<range3(2));

%figure(1),clf
%my2dPlot(d.w1(ind1),d.w3(ind3),d.R(ind3,ind1),'pumpprobe',false)
%title(sprintf('t_2 = %8.1f ps',d.t2/1000))
options.n_w = 256;
options.phase = 0;
options.flag_plot = true;
options.range1 = range1;
options.range3 = range3;
options.peak_pos = [2340,2340];

result = fromAbsorptiveToRandNR(d.w1,d.w3,d.R,options);
phase = intrinsicPhasing(result.w1,result.w3,result.S,options);
%close all;