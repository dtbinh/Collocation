function c_ineq = c_ineq_func(in1,in2)
%C_INEQ_FUNC
%    C_INEQ = C_INEQ_FUNC(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    24-Oct-2018 16:14:12

c = in2(:,2);
fLegMin = in2(:,20);
fLegMax = in2(:,21);
k = in2(:,3);
lf = in2(:,8);
rMax = in2(:,23);
rMin = in2(:,22);
transmission_ankle = in2(:,9);
x1 = in1(1,:);
x2 = in1(2,:);
x3 = in1(3,:);
x4 = in1(4,:);
x5 = in1(5,:);
x6 = in1(6,:);
x7 = in1(7,:);
x8 = in1(8,:);
x9 = in1(9,:);
x10 = in1(10,:);
x11 = in1(11,:);
x12 = in1(12,:);
x13 = in1(13,:);
x14 = in1(14,:);
x15 = in1(15,:);
x16 = in1(16,:);
x17 = in1(17,:);
x18 = in1(18,:);
x19 = in1(19,:);
x20 = in1(20,:);
x21 = in1(21,:);
x22 = in1(22,:);
x23 = in1(23,:);
x24 = in1(24,:);
x25 = in1(25,:);
x26 = in1(26,:);
x27 = in1(27,:);
x28 = in1(28,:);
x29 = in1(29,:);
x30 = in1(30,:);
x31 = in1(31,:);
x32 = in1(32,:);
x33 = in1(33,:);
x34 = in1(34,:);
x35 = in1(35,:);
x36 = in1(36,:);
x37 = in1(37,:);
x38 = in1(38,:);
x39 = in1(39,:);
x40 = in1(40,:);
x41 = in1(41,:);
x42 = in1(42,:);
x43 = in1(43,:);
x44 = in1(44,:);
x45 = in1(45,:);
x46 = in1(46,:);
x47 = in1(47,:);
x48 = in1(48,:);
x49 = in1(49,:);
x50 = in1(50,:);
x51 = in1(51,:);
x52 = in1(52,:);
x53 = in1(53,:);
x54 = in1(54,:);
x55 = in1(55,:);
x56 = in1(56,:);
x57 = in1(57,:);
x58 = in1(58,:);
x59 = in1(59,:);
x60 = in1(60,:);
x61 = in1(61,:);
x62 = in1(62,:);
x63 = in1(63,:);
x64 = in1(64,:);
x65 = in1(65,:);
x66 = in1(66,:);
x67 = in1(67,:);
x68 = in1(68,:);
x69 = in1(69,:);
x70 = in1(70,:);
x71 = in1(71,:);
x72 = in1(72,:);
x73 = in1(73,:);
x74 = in1(74,:);
x75 = in1(75,:);
x76 = in1(76,:);
x77 = in1(77,:);
x78 = in1(78,:);
x79 = in1(79,:);
x80 = in1(80,:);
x81 = in1(81,:);
x82 = in1(82,:);
x83 = in1(83,:);
x84 = in1(84,:);
x85 = in1(85,:);
x86 = in1(86,:);
x87 = in1(87,:);
x88 = in1(88,:);
x89 = in1(89,:);
x90 = in1(90,:);
x91 = in1(91,:);
x92 = in1(92,:);
x93 = in1(93,:);
x94 = in1(94,:);
x95 = in1(95,:);
x96 = in1(96,:);
x97 = in1(97,:);
x98 = in1(98,:);
x99 = in1(99,:);
x100 = in1(100,:);
x101 = in1(101,:);
x102 = in1(102,:);
x103 = in1(103,:);
x104 = in1(104,:);
x105 = in1(105,:);
x106 = in1(106,:);
x107 = in1(107,:);
x108 = in1(108,:);
x109 = in1(109,:);
x110 = in1(110,:);
x111 = in1(111,:);
x112 = in1(112,:);
x113 = in1(113,:);
x114 = in1(114,:);
x115 = in1(115,:);
x116 = in1(116,:);
x117 = in1(117,:);
x118 = in1(118,:);
x119 = in1(119,:);
x120 = in1(120,:);
x121 = in1(121,:);
x122 = in1(122,:);
x123 = in1(123,:);
x124 = in1(124,:);
x125 = in1(125,:);
x126 = in1(126,:);
x127 = in1(127,:);
x128 = in1(128,:);
x129 = in1(129,:);
x130 = in1(130,:);
x131 = in1(131,:);
x132 = in1(132,:);
x133 = in1(133,:);
x134 = in1(134,:);
x135 = in1(135,:);
x136 = in1(136,:);
x137 = in1(137,:);
x138 = in1(138,:);
x139 = in1(139,:);
x140 = in1(140,:);
x141 = in1(141,:);
x142 = in1(142,:);
x143 = in1(143,:);
x144 = in1(144,:);
x145 = in1(145,:);
x146 = in1(146,:);
x147 = in1(147,:);
x148 = in1(148,:);
x149 = in1(149,:);
x150 = in1(150,:);
x151 = in1(151,:);
x152 = in1(152,:);
x153 = in1(153,:);
x154 = in1(154,:);
x155 = in1(155,:);
x156 = in1(156,:);
x157 = in1(157,:);
x158 = in1(158,:);
x159 = in1(159,:);
x160 = in1(160,:);
x161 = in1(161,:);
x162 = in1(162,:);
x163 = in1(163,:);
x164 = in1(164,:);
x165 = in1(165,:);
x166 = in1(166,:);
x167 = in1(167,:);
x168 = in1(168,:);
x169 = in1(169,:);
x170 = in1(170,:);
x171 = in1(171,:);
x172 = in1(172,:);
x173 = in1(173,:);
x174 = in1(174,:);
x175 = in1(175,:);
x176 = in1(176,:);
x177 = in1(177,:);
x178 = in1(178,:);
x179 = in1(179,:);
x180 = in1(180,:);
x211 = in1(211,:);
x212 = in1(212,:);
x213 = in1(213,:);
x214 = in1(214,:);
x215 = in1(215,:);
x216 = in1(216,:);
x217 = in1(217,:);
x218 = in1(218,:);
x219 = in1(219,:);
x220 = in1(220,:);
x221 = in1(221,:);
x222 = in1(222,:);
x223 = in1(223,:);
x224 = in1(224,:);
x225 = in1(225,:);
x226 = in1(226,:);
x227 = in1(227,:);
x228 = in1(228,:);
x229 = in1(229,:);
x230 = in1(230,:);
x231 = in1(231,:);
x232 = in1(232,:);
x233 = in1(233,:);
x234 = in1(234,:);
x235 = in1(235,:);
x236 = in1(236,:);
x237 = in1(237,:);
x238 = in1(238,:);
x239 = in1(239,:);
x240 = in1(240,:);
c_ineq = [transmission_ankle.*x211-(lf.*x31.*1.0./sqrt(x1.^2+x31.^2).*(c.*(x151-1.0./sqrt(x1.^2+x31.^2).*(x1.*x91+x31.*x121))+k.*(x61-sqrt(x1.^2+x31.^2))))./2.0;transmission_ankle.*x212-(lf.*x32.*1.0./sqrt(x2.^2+x32.^2).*(c.*(x152-1.0./sqrt(x2.^2+x32.^2).*(x2.*x92+x32.*x122))+k.*(x62-sqrt(x2.^2+x32.^2))))./2.0;transmission_ankle.*x213-(lf.*x33.*1.0./sqrt(x3.^2+x33.^2).*(c.*(x153-1.0./sqrt(x3.^2+x33.^2).*(x3.*x93+x33.*x123))+k.*(x63-sqrt(x3.^2+x33.^2))))./2.0;transmission_ankle.*x214-(lf.*x34.*1.0./sqrt(x4.^2+x34.^2).*(c.*(x154-1.0./sqrt(x4.^2+x34.^2).*(x4.*x94+x34.*x124))+k.*(x64-sqrt(x4.^2+x34.^2))))./2.0;transmission_ankle.*x215-(lf.*x35.*1.0./sqrt(x5.^2+x35.^2).*(c.*(x155-1.0./sqrt(x5.^2+x35.^2).*(x5.*x95+x35.*x125))+k.*(x65-sqrt(x5.^2+x35.^2))))./2.0;transmission_ankle.*x216-(lf.*x36.*1.0./sqrt(x6.^2+x36.^2).*(c.*(x156-1.0./sqrt(x6.^2+x36.^2).*(x6.*x96+x36.*x126))+k.*(x66-sqrt(x6.^2+x36.^2))))./2.0;transmission_ankle.*x217-(lf.*x37.*1.0./sqrt(x7.^2+x37.^2).*(c.*(x157-1.0./sqrt(x7.^2+x37.^2).*(x7.*x97+x37.*x127))+k.*(x67-sqrt(x7.^2+x37.^2))))./2.0;transmission_ankle.*x218-(lf.*x38.*1.0./sqrt(x8.^2+x38.^2).*(c.*(x158-1.0./sqrt(x8.^2+x38.^2).*(x8.*x98+x38.*x128))+k.*(x68-sqrt(x8.^2+x38.^2))))./2.0;transmission_ankle.*x219-(lf.*x39.*1.0./sqrt(x9.^2+x39.^2).*(c.*(x159-1.0./sqrt(x9.^2+x39.^2).*(x9.*x99+x39.*x129))+k.*(x69-sqrt(x9.^2+x39.^2))))./2.0;transmission_ankle.*x220-(lf.*x40.*1.0./sqrt(x10.^2+x40.^2).*(c.*(x160-1.0./sqrt(x10.^2+x40.^2).*(x10.*x100+x40.*x130))+k.*(x70-sqrt(x10.^2+x40.^2))))./2.0;transmission_ankle.*x221-(lf.*x41.*1.0./sqrt(x11.^2+x41.^2).*(c.*(x161-1.0./sqrt(x11.^2+x41.^2).*(x11.*x101+x41.*x131))+k.*(x71-sqrt(x11.^2+x41.^2))))./2.0;transmission_ankle.*x222-(lf.*x42.*1.0./sqrt(x12.^2+x42.^2).*(c.*(x162-1.0./sqrt(x12.^2+x42.^2).*(x12.*x102+x42.*x132))+k.*(x72-sqrt(x12.^2+x42.^2))))./2.0;transmission_ankle.*x223-(lf.*x43.*1.0./sqrt(x13.^2+x43.^2).*(c.*(x163-1.0./sqrt(x13.^2+x43.^2).*(x13.*x103+x43.*x133))+k.*(x73-sqrt(x13.^2+x43.^2))))./2.0;transmission_ankle.*x224-(lf.*x44.*1.0./sqrt(x14.^2+x44.^2).*(c.*(x164-1.0./sqrt(x14.^2+x44.^2).*(x14.*x104+x44.*x134))+k.*(x74-sqrt(x14.^2+x44.^2))))./2.0;transmission_ankle.*x225-(lf.*x45.*1.0./sqrt(x15.^2+x45.^2).*(c.*(x165-1.0./sqrt(x15.^2+x45.^2).*(x15.*x105+x45.*x135))+k.*(x75-sqrt(x15.^2+x45.^2))))./2.0;transmission_ankle.*x226-(lf.*x46.*1.0./sqrt(x16.^2+x46.^2).*(c.*(x166-1.0./sqrt(x16.^2+x46.^2).*(x16.*x106+x46.*x136))+k.*(x76-sqrt(x16.^2+x46.^2))))./2.0;transmission_ankle.*x227-(lf.*x47.*1.0./sqrt(x17.^2+x47.^2).*(c.*(x167-1.0./sqrt(x17.^2+x47.^2).*(x17.*x107+x47.*x137))+k.*(x77-sqrt(x17.^2+x47.^2))))./2.0;transmission_ankle.*x228-(lf.*x48.*1.0./sqrt(x18.^2+x48.^2).*(c.*(x168-1.0./sqrt(x18.^2+x48.^2).*(x18.*x108+x48.*x138))+k.*(x78-sqrt(x18.^2+x48.^2))))./2.0;transmission_ankle.*x229-(lf.*x49.*1.0./sqrt(x19.^2+x49.^2).*(c.*(x169-1.0./sqrt(x19.^2+x49.^2).*(x19.*x109+x49.*x139))+k.*(x79-sqrt(x19.^2+x49.^2))))./2.0;transmission_ankle.*x230-(lf.*x50.*1.0./sqrt(x20.^2+x50.^2).*(c.*(x170-1.0./sqrt(x20.^2+x50.^2).*(x20.*x110+x50.*x140))+k.*(x80-sqrt(x20.^2+x50.^2))))./2.0;transmission_ankle.*x231-(lf.*x51.*1.0./sqrt(x21.^2+x51.^2).*(c.*(x171-1.0./sqrt(x21.^2+x51.^2).*(x21.*x111+x51.*x141))+k.*(x81-sqrt(x21.^2+x51.^2))))./2.0;transmission_ankle.*x232-(lf.*x52.*1.0./sqrt(x22.^2+x52.^2).*(c.*(x172-1.0./sqrt(x22.^2+x52.^2).*(x22.*x112+x52.*x142))+k.*(x82-sqrt(x22.^2+x52.^2))))./2.0;transmission_ankle.*x233-(lf.*x53.*1.0./sqrt(x23.^2+x53.^2).*(c.*(x173-1.0./sqrt(x23.^2+x53.^2).*(x23.*x113+x53.*x143))+k.*(x83-sqrt(x23.^2+x53.^2))))./2.0;transmission_ankle.*x234-(lf.*x54.*1.0./sqrt(x24.^2+x54.^2).*(c.*(x174-1.0./sqrt(x24.^2+x54.^2).*(x24.*x114+x54.*x144))+k.*(x84-sqrt(x24.^2+x54.^2))))./2.0;transmission_ankle.*x235-(lf.*x55.*1.0./sqrt(x25.^2+x55.^2).*(c.*(x175-1.0./sqrt(x25.^2+x55.^2).*(x25.*x115+x55.*x145))+k.*(x85-sqrt(x25.^2+x55.^2))))./2.0;transmission_ankle.*x236-(lf.*x56.*1.0./sqrt(x26.^2+x56.^2).*(c.*(x176-1.0./sqrt(x26.^2+x56.^2).*(x26.*x116+x56.*x146))+k.*(x86-sqrt(x26.^2+x56.^2))))./2.0;transmission_ankle.*x237-(lf.*x57.*1.0./sqrt(x27.^2+x57.^2).*(c.*(x177-1.0./sqrt(x27.^2+x57.^2).*(x27.*x117+x57.*x147))+k.*(x87-sqrt(x27.^2+x57.^2))))./2.0;transmission_ankle.*x238-(lf.*x58.*1.0./sqrt(x28.^2+x58.^2).*(c.*(x178-1.0./sqrt(x28.^2+x58.^2).*(x28.*x118+x58.*x148))+k.*(x88-sqrt(x28.^2+x58.^2))))./2.0;transmission_ankle.*x239-(lf.*x59.*1.0./sqrt(x29.^2+x59.^2).*(c.*(x179-1.0./sqrt(x29.^2+x59.^2).*(x29.*x119+x59.*x149))+k.*(x89-sqrt(x29.^2+x59.^2))))./2.0;transmission_ankle.*x240-(lf.*x60.*1.0./sqrt(x30.^2+x60.^2).*(c.*(x180-1.0./sqrt(x30.^2+x60.^2).*(x30.*x120+x60.*x150))+k.*(x90-sqrt(x30.^2+x60.^2))))./2.0;-transmission_ankle.*x211-(lf.*x31.*1.0./sqrt(x1.^2+x31.^2).*(c.*(x151-1.0./sqrt(x1.^2+x31.^2).*(x1.*x91+x31.*x121))+k.*(x61-sqrt(x1.^2+x31.^2))))./2.0;-transmission_ankle.*x212-(lf.*x32.*1.0./sqrt(x2.^2+x32.^2).*(c.*(x152-1.0./sqrt(x2.^2+x32.^2).*(x2.*x92+x32.*x122))+k.*(x62-sqrt(x2.^2+x32.^2))))./2.0;-transmission_ankle.*x213-(lf.*x33.*1.0./sqrt(x3.^2+x33.^2).*(c.*(x153-1.0./sqrt(x3.^2+x33.^2).*(x3.*x93+x33.*x123))+k.*(x63-sqrt(x3.^2+x33.^2))))./2.0;-transmission_ankle.*x214-(lf.*x34.*1.0./sqrt(x4.^2+x34.^2).*(c.*(x154-1.0./sqrt(x4.^2+x34.^2).*(x4.*x94+x34.*x124))+k.*(x64-sqrt(x4.^2+x34.^2))))./2.0;-transmission_ankle.*x215-(lf.*x35.*1.0./sqrt(x5.^2+x35.^2).*(c.*(x155-1.0./sqrt(x5.^2+x35.^2).*(x5.*x95+x35.*x125))+k.*(x65-sqrt(x5.^2+x35.^2))))./2.0;-transmission_ankle.*x216-(lf.*x36.*1.0./sqrt(x6.^2+x36.^2).*(c.*(x156-1.0./sqrt(x6.^2+x36.^2).*(x6.*x96+x36.*x126))+k.*(x66-sqrt(x6.^2+x36.^2))))./2.0;-transmission_ankle.*x217-(lf.*x37.*1.0./sqrt(x7.^2+x37.^2).*(c.*(x157-1.0./sqrt(x7.^2+x37.^2).*(x7.*x97+x37.*x127))+k.*(x67-sqrt(x7.^2+x37.^2))))./2.0;-transmission_ankle.*x218-(lf.*x38.*1.0./sqrt(x8.^2+x38.^2).*(c.*(x158-1.0./sqrt(x8.^2+x38.^2).*(x8.*x98+x38.*x128))+k.*(x68-sqrt(x8.^2+x38.^2))))./2.0;-transmission_ankle.*x219-(lf.*x39.*1.0./sqrt(x9.^2+x39.^2).*(c.*(x159-1.0./sqrt(x9.^2+x39.^2).*(x9.*x99+x39.*x129))+k.*(x69-sqrt(x9.^2+x39.^2))))./2.0;-transmission_ankle.*x220-(lf.*x40.*1.0./sqrt(x10.^2+x40.^2).*(c.*(x160-1.0./sqrt(x10.^2+x40.^2).*(x10.*x100+x40.*x130))+k.*(x70-sqrt(x10.^2+x40.^2))))./2.0;-transmission_ankle.*x221-(lf.*x41.*1.0./sqrt(x11.^2+x41.^2).*(c.*(x161-1.0./sqrt(x11.^2+x41.^2).*(x11.*x101+x41.*x131))+k.*(x71-sqrt(x11.^2+x41.^2))))./2.0;-transmission_ankle.*x222-(lf.*x42.*1.0./sqrt(x12.^2+x42.^2).*(c.*(x162-1.0./sqrt(x12.^2+x42.^2).*(x12.*x102+x42.*x132))+k.*(x72-sqrt(x12.^2+x42.^2))))./2.0;-transmission_ankle.*x223-(lf.*x43.*1.0./sqrt(x13.^2+x43.^2).*(c.*(x163-1.0./sqrt(x13.^2+x43.^2).*(x13.*x103+x43.*x133))+k.*(x73-sqrt(x13.^2+x43.^2))))./2.0;-transmission_ankle.*x224-(lf.*x44.*1.0./sqrt(x14.^2+x44.^2).*(c.*(x164-1.0./sqrt(x14.^2+x44.^2).*(x14.*x104+x44.*x134))+k.*(x74-sqrt(x14.^2+x44.^2))))./2.0;-transmission_ankle.*x225-(lf.*x45.*1.0./sqrt(x15.^2+x45.^2).*(c.*(x165-1.0./sqrt(x15.^2+x45.^2).*(x15.*x105+x45.*x135))+k.*(x75-sqrt(x15.^2+x45.^2))))./2.0;-transmission_ankle.*x226-(lf.*x46.*1.0./sqrt(x16.^2+x46.^2).*(c.*(x166-1.0./sqrt(x16.^2+x46.^2).*(x16.*x106+x46.*x136))+k.*(x76-sqrt(x16.^2+x46.^2))))./2.0;-transmission_ankle.*x227-(lf.*x47.*1.0./sqrt(x17.^2+x47.^2).*(c.*(x167-1.0./sqrt(x17.^2+x47.^2).*(x17.*x107+x47.*x137))+k.*(x77-sqrt(x17.^2+x47.^2))))./2.0;-transmission_ankle.*x228-(lf.*x48.*1.0./sqrt(x18.^2+x48.^2).*(c.*(x168-1.0./sqrt(x18.^2+x48.^2).*(x18.*x108+x48.*x138))+k.*(x78-sqrt(x18.^2+x48.^2))))./2.0;-transmission_ankle.*x229-(lf.*x49.*1.0./sqrt(x19.^2+x49.^2).*(c.*(x169-1.0./sqrt(x19.^2+x49.^2).*(x19.*x109+x49.*x139))+k.*(x79-sqrt(x19.^2+x49.^2))))./2.0;-transmission_ankle.*x230-(lf.*x50.*1.0./sqrt(x20.^2+x50.^2).*(c.*(x170-1.0./sqrt(x20.^2+x50.^2).*(x20.*x110+x50.*x140))+k.*(x80-sqrt(x20.^2+x50.^2))))./2.0;-transmission_ankle.*x231-(lf.*x51.*1.0./sqrt(x21.^2+x51.^2).*(c.*(x171-1.0./sqrt(x21.^2+x51.^2).*(x21.*x111+x51.*x141))+k.*(x81-sqrt(x21.^2+x51.^2))))./2.0;-transmission_ankle.*x232-(lf.*x52.*1.0./sqrt(x22.^2+x52.^2).*(c.*(x172-1.0./sqrt(x22.^2+x52.^2).*(x22.*x112+x52.*x142))+k.*(x82-sqrt(x22.^2+x52.^2))))./2.0;-transmission_ankle.*x233-(lf.*x53.*1.0./sqrt(x23.^2+x53.^2).*(c.*(x173-1.0./sqrt(x23.^2+x53.^2).*(x23.*x113+x53.*x143))+k.*(x83-sqrt(x23.^2+x53.^2))))./2.0;-transmission_ankle.*x234-(lf.*x54.*1.0./sqrt(x24.^2+x54.^2).*(c.*(x174-1.0./sqrt(x24.^2+x54.^2).*(x24.*x114+x54.*x144))+k.*(x84-sqrt(x24.^2+x54.^2))))./2.0;-transmission_ankle.*x235-(lf.*x55.*1.0./sqrt(x25.^2+x55.^2).*(c.*(x175-1.0./sqrt(x25.^2+x55.^2).*(x25.*x115+x55.*x145))+k.*(x85-sqrt(x25.^2+x55.^2))))./2.0;-transmission_ankle.*x236-(lf.*x56.*1.0./sqrt(x26.^2+x56.^2).*(c.*(x176-1.0./sqrt(x26.^2+x56.^2).*(x26.*x116+x56.*x146))+k.*(x86-sqrt(x26.^2+x56.^2))))./2.0;-transmission_ankle.*x237-(lf.*x57.*1.0./sqrt(x27.^2+x57.^2).*(c.*(x177-1.0./sqrt(x27.^2+x57.^2).*(x27.*x117+x57.*x147))+k.*(x87-sqrt(x27.^2+x57.^2))))./2.0;-transmission_ankle.*x238-(lf.*x58.*1.0./sqrt(x28.^2+x58.^2).*(c.*(x178-1.0./sqrt(x28.^2+x58.^2).*(x28.*x118+x58.*x148))+k.*(x88-sqrt(x28.^2+x58.^2))))./2.0;-transmission_ankle.*x239-(lf.*x59.*1.0./sqrt(x29.^2+x59.^2).*(c.*(x179-1.0./sqrt(x29.^2+x59.^2).*(x29.*x119+x59.*x149))+k.*(x89-sqrt(x29.^2+x59.^2))))./2.0;-transmission_ankle.*x240-(lf.*x60.*1.0./sqrt(x30.^2+x60.^2).*(c.*(x180-1.0./sqrt(x30.^2+x60.^2).*(x30.*x120+x60.*x150))+k.*(x90-sqrt(x30.^2+x60.^2))))./2.0;-fLegMax+c.*(x151-1.0./sqrt(x1.^2+x31.^2).*(x1.*x91+x31.*x121))+k.*(x61-sqrt(x1.^2+x31.^2));-fLegMax+c.*(x152-1.0./sqrt(x2.^2+x32.^2).*(x2.*x92+x32.*x122))+k.*(x62-sqrt(x2.^2+x32.^2));-fLegMax+c.*(x153-1.0./sqrt(x3.^2+x33.^2).*(x3.*x93+x33.*x123))+k.*(x63-sqrt(x3.^2+x33.^2));-fLegMax+c.*(x154-1.0./sqrt(x4.^2+x34.^2).*(x4.*x94+x34.*x124))+k.*(x64-sqrt(x4.^2+x34.^2));-fLegMax+c.*(x155-1.0./sqrt(x5.^2+x35.^2).*(x5.*x95+x35.*x125))+k.*(x65-sqrt(x5.^2+x35.^2));-fLegMax+c.*(x156-1.0./sqrt(x6.^2+x36.^2).*(x6.*x96+x36.*x126))+k.*(x66-sqrt(x6.^2+x36.^2));-fLegMax+c.*(x157-1.0./sqrt(x7.^2+x37.^2).*(x7.*x97+x37.*x127))+k.*(x67-sqrt(x7.^2+x37.^2));-fLegMax+c.*(x158-1.0./sqrt(x8.^2+x38.^2).*(x8.*x98+x38.*x128))+k.*(x68-sqrt(x8.^2+x38.^2));-fLegMax+c.*(x159-1.0./sqrt(x9.^2+x39.^2).*(x9.*x99+x39.*x129))+k.*(x69-sqrt(x9.^2+x39.^2));-fLegMax+c.*(x160-1.0./sqrt(x10.^2+x40.^2).*(x10.*x100+x40.*x130))+k.*(x70-sqrt(x10.^2+x40.^2));-fLegMax+c.*(x161-1.0./sqrt(x11.^2+x41.^2).*(x11.*x101+x41.*x131))+k.*(x71-sqrt(x11.^2+x41.^2));-fLegMax+c.*(x162-1.0./sqrt(x12.^2+x42.^2).*(x12.*x102+x42.*x132))+k.*(x72-sqrt(x12.^2+x42.^2));-fLegMax+c.*(x163-1.0./sqrt(x13.^2+x43.^2).*(x13.*x103+x43.*x133))+k.*(x73-sqrt(x13.^2+x43.^2));-fLegMax+c.*(x164-1.0./sqrt(x14.^2+x44.^2).*(x14.*x104+x44.*x134))+k.*(x74-sqrt(x14.^2+x44.^2));-fLegMax+c.*(x165-1.0./sqrt(x15.^2+x45.^2).*(x15.*x105+x45.*x135))+k.*(x75-sqrt(x15.^2+x45.^2));-fLegMax+c.*(x166-1.0./sqrt(x16.^2+x46.^2).*(x16.*x106+x46.*x136))+k.*(x76-sqrt(x16.^2+x46.^2));-fLegMax+c.*(x167-1.0./sqrt(x17.^2+x47.^2).*(x17.*x107+x47.*x137))+k.*(x77-sqrt(x17.^2+x47.^2));-fLegMax+c.*(x168-1.0./sqrt(x18.^2+x48.^2).*(x18.*x108+x48.*x138))+k.*(x78-sqrt(x18.^2+x48.^2));-fLegMax+c.*(x169-1.0./sqrt(x19.^2+x49.^2).*(x19.*x109+x49.*x139))+k.*(x79-sqrt(x19.^2+x49.^2));-fLegMax+c.*(x170-1.0./sqrt(x20.^2+x50.^2).*(x20.*x110+x50.*x140))+k.*(x80-sqrt(x20.^2+x50.^2));-fLegMax+c.*(x171-1.0./sqrt(x21.^2+x51.^2).*(x21.*x111+x51.*x141))+k.*(x81-sqrt(x21.^2+x51.^2));-fLegMax+c.*(x172-1.0./sqrt(x22.^2+x52.^2).*(x22.*x112+x52.*x142))+k.*(x82-sqrt(x22.^2+x52.^2));-fLegMax+c.*(x173-1.0./sqrt(x23.^2+x53.^2).*(x23.*x113+x53.*x143))+k.*(x83-sqrt(x23.^2+x53.^2));-fLegMax+c.*(x174-1.0./sqrt(x24.^2+x54.^2).*(x24.*x114+x54.*x144))+k.*(x84-sqrt(x24.^2+x54.^2));-fLegMax+c.*(x175-1.0./sqrt(x25.^2+x55.^2).*(x25.*x115+x55.*x145))+k.*(x85-sqrt(x25.^2+x55.^2));-fLegMax+c.*(x176-1.0./sqrt(x26.^2+x56.^2).*(x26.*x116+x56.*x146))+k.*(x86-sqrt(x26.^2+x56.^2));-fLegMax+c.*(x177-1.0./sqrt(x27.^2+x57.^2).*(x27.*x117+x57.*x147))+k.*(x87-sqrt(x27.^2+x57.^2));-fLegMax+c.*(x178-1.0./sqrt(x28.^2+x58.^2).*(x28.*x118+x58.*x148))+k.*(x88-sqrt(x28.^2+x58.^2));-fLegMax+c.*(x179-1.0./sqrt(x29.^2+x59.^2).*(x29.*x119+x59.*x149))+k.*(x89-sqrt(x29.^2+x59.^2));-fLegMax+c.*(x180-1.0./sqrt(x30.^2+x60.^2).*(x30.*x120+x60.*x150))+k.*(x90-sqrt(x30.^2+x60.^2));fLegMin-c.*(x151-1.0./sqrt(x1.^2+x31.^2).*(x1.*x91+x31.*x121))-k.*(x61-sqrt(x1.^2+x31.^2));fLegMin-c.*(x152-1.0./sqrt(x2.^2+x32.^2).*(x2.*x92+x32.*x122))-k.*(x62-sqrt(x2.^2+x32.^2));fLegMin-c.*(x153-1.0./sqrt(x3.^2+x33.^2).*(x3.*x93+x33.*x123))-k.*(x63-sqrt(x3.^2+x33.^2));fLegMin-c.*(x154-1.0./sqrt(x4.^2+x34.^2).*(x4.*x94+x34.*x124))-k.*(x64-sqrt(x4.^2+x34.^2));fLegMin-c.*(x155-1.0./sqrt(x5.^2+x35.^2).*(x5.*x95+x35.*x125))-k.*(x65-sqrt(x5.^2+x35.^2));fLegMin-c.*(x156-1.0./sqrt(x6.^2+x36.^2).*(x6.*x96+x36.*x126))-k.*(x66-sqrt(x6.^2+x36.^2));fLegMin-c.*(x157-1.0./sqrt(x7.^2+x37.^2).*(x7.*x97+x37.*x127))-k.*(x67-sqrt(x7.^2+x37.^2));fLegMin-c.*(x158-1.0./sqrt(x8.^2+x38.^2).*(x8.*x98+x38.*x128))-k.*(x68-sqrt(x8.^2+x38.^2));fLegMin-c.*(x159-1.0./sqrt(x9.^2+x39.^2).*(x9.*x99+x39.*x129))-k.*(x69-sqrt(x9.^2+x39.^2));fLegMin-c.*(x160-1.0./sqrt(x10.^2+x40.^2).*(x10.*x100+x40.*x130))-k.*(x70-sqrt(x10.^2+x40.^2));fLegMin-c.*(x161-1.0./sqrt(x11.^2+x41.^2).*(x11.*x101+x41.*x131))-k.*(x71-sqrt(x11.^2+x41.^2));fLegMin-c.*(x162-1.0./sqrt(x12.^2+x42.^2).*(x12.*x102+x42.*x132))-k.*(x72-sqrt(x12.^2+x42.^2));fLegMin-c.*(x163-1.0./sqrt(x13.^2+x43.^2).*(x13.*x103+x43.*x133))-k.*(x73-sqrt(x13.^2+x43.^2));fLegMin-c.*(x164-1.0./sqrt(x14.^2+x44.^2).*(x14.*x104+x44.*x134))-k.*(x74-sqrt(x14.^2+x44.^2));fLegMin-c.*(x165-1.0./sqrt(x15.^2+x45.^2).*(x15.*x105+x45.*x135))-k.*(x75-sqrt(x15.^2+x45.^2));fLegMin-c.*(x166-1.0./sqrt(x16.^2+x46.^2).*(x16.*x106+x46.*x136))-k.*(x76-sqrt(x16.^2+x46.^2));fLegMin-c.*(x167-1.0./sqrt(x17.^2+x47.^2).*(x17.*x107+x47.*x137))-k.*(x77-sqrt(x17.^2+x47.^2));fLegMin-c.*(x168-1.0./sqrt(x18.^2+x48.^2).*(x18.*x108+x48.*x138))-k.*(x78-sqrt(x18.^2+x48.^2));fLegMin-c.*(x169-1.0./sqrt(x19.^2+x49.^2).*(x19.*x109+x49.*x139))-k.*(x79-sqrt(x19.^2+x49.^2));fLegMin-c.*(x170-1.0./sqrt(x20.^2+x50.^2).*(x20.*x110+x50.*x140))-k.*(x80-sqrt(x20.^2+x50.^2));fLegMin-c.*(x171-1.0./sqrt(x21.^2+x51.^2).*(x21.*x111+x51.*x141))-k.*(x81-sqrt(x21.^2+x51.^2));fLegMin-c.*(x172-1.0./sqrt(x22.^2+x52.^2).*(x22.*x112+x52.*x142))-k.*(x82-sqrt(x22.^2+x52.^2));fLegMin-c.*(x173-1.0./sqrt(x23.^2+x53.^2).*(x23.*x113+x53.*x143))-k.*(x83-sqrt(x23.^2+x53.^2));fLegMin-c.*(x174-1.0./sqrt(x24.^2+x54.^2).*(x24.*x114+x54.*x144))-k.*(x84-sqrt(x24.^2+x54.^2));fLegMin-c.*(x175-1.0./sqrt(x25.^2+x55.^2).*(x25.*x115+x55.*x145))-k.*(x85-sqrt(x25.^2+x55.^2));fLegMin-c.*(x176-1.0./sqrt(x26.^2+x56.^2).*(x26.*x116+x56.*x146))-k.*(x86-sqrt(x26.^2+x56.^2));fLegMin-c.*(x177-1.0./sqrt(x27.^2+x57.^2).*(x27.*x117+x57.*x147))-k.*(x87-sqrt(x27.^2+x57.^2));fLegMin-c.*(x178-1.0./sqrt(x28.^2+x58.^2).*(x28.*x118+x58.*x148))-k.*(x88-sqrt(x28.^2+x58.^2));fLegMin-c.*(x179-1.0./sqrt(x29.^2+x59.^2).*(x29.*x119+x59.*x149))-k.*(x89-sqrt(x29.^2+x59.^2));fLegMin-c.*(x180-1.0./sqrt(x30.^2+x60.^2).*(x30.*x120+x60.*x150))-k.*(x90-sqrt(x30.^2+x60.^2));-rMax+sqrt(x1.^2+x31.^2);-rMax+sqrt(x2.^2+x32.^2);-rMax+sqrt(x3.^2+x33.^2);-rMax+sqrt(x4.^2+x34.^2);-rMax+sqrt(x5.^2+x35.^2);-rMax+sqrt(x6.^2+x36.^2);-rMax+sqrt(x7.^2+x37.^2);-rMax+sqrt(x8.^2+x38.^2);-rMax+sqrt(x9.^2+x39.^2);-rMax+sqrt(x10.^2+x40.^2);-rMax+sqrt(x11.^2+x41.^2);-rMax+sqrt(x12.^2+x42.^2);-rMax+sqrt(x13.^2+x43.^2);-rMax+sqrt(x14.^2+x44.^2);-rMax+sqrt(x15.^2+x45.^2);-rMax+sqrt(x16.^2+x46.^2);-rMax+sqrt(x17.^2+x47.^2);-rMax+sqrt(x18.^2+x48.^2);-rMax+sqrt(x19.^2+x49.^2);-rMax+sqrt(x20.^2+x50.^2);-rMax+sqrt(x21.^2+x51.^2);-rMax+sqrt(x22.^2+x52.^2);-rMax+sqrt(x23.^2+x53.^2);-rMax+sqrt(x24.^2+x54.^2);-rMax+sqrt(x25.^2+x55.^2);-rMax+sqrt(x26.^2+x56.^2);-rMax+sqrt(x27.^2+x57.^2);-rMax+sqrt(x28.^2+x58.^2);-rMax+sqrt(x29.^2+x59.^2);-rMax+sqrt(x30.^2+x60.^2);rMin-sqrt(x1.^2+x31.^2);rMin-sqrt(x2.^2+x32.^2);rMin-sqrt(x3.^2+x33.^2);rMin-sqrt(x4.^2+x34.^2);rMin-sqrt(x5.^2+x35.^2);rMin-sqrt(x6.^2+x36.^2);rMin-sqrt(x7.^2+x37.^2);rMin-sqrt(x8.^2+x38.^2);rMin-sqrt(x9.^2+x39.^2);rMin-sqrt(x10.^2+x40.^2);rMin-sqrt(x11.^2+x41.^2);rMin-sqrt(x12.^2+x42.^2);rMin-sqrt(x13.^2+x43.^2);rMin-sqrt(x14.^2+x44.^2);rMin-sqrt(x15.^2+x45.^2);rMin-sqrt(x16.^2+x46.^2);rMin-sqrt(x17.^2+x47.^2);rMin-sqrt(x18.^2+x48.^2);rMin-sqrt(x19.^2+x49.^2);rMin-sqrt(x20.^2+x50.^2);rMin-sqrt(x21.^2+x51.^2);rMin-sqrt(x22.^2+x52.^2);rMin-sqrt(x23.^2+x53.^2);rMin-sqrt(x24.^2+x54.^2);rMin-sqrt(x25.^2+x55.^2);rMin-sqrt(x26.^2+x56.^2);rMin-sqrt(x27.^2+x57.^2);rMin-sqrt(x28.^2+x58.^2);rMin-sqrt(x29.^2+x59.^2);rMin-sqrt(x30.^2+x60.^2);x121;-x150];
