function c_ineq = c_ineq_func(in1,in2)
%C_INEQ_FUNC
%    C_INEQ = C_INEQ_FUNC(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    28-Sep-2018 13:38:51

dthetaMax = in2(:,15);
k = in2(:,3);
lf = in2(:,8);
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
x181 = in1(181,:);
x182 = in1(182,:);
x183 = in1(183,:);
x184 = in1(184,:);
x185 = in1(185,:);
x186 = in1(186,:);
x187 = in1(187,:);
x188 = in1(188,:);
x189 = in1(189,:);
x190 = in1(190,:);
x191 = in1(191,:);
x192 = in1(192,:);
x193 = in1(193,:);
x194 = in1(194,:);
x195 = in1(195,:);
x196 = in1(196,:);
x197 = in1(197,:);
x198 = in1(198,:);
x199 = in1(199,:);
x200 = in1(200,:);
x201 = in1(201,:);
x202 = in1(202,:);
x203 = in1(203,:);
x204 = in1(204,:);
x205 = in1(205,:);
x206 = in1(206,:);
x207 = in1(207,:);
x484 = in1(484,:);
x485 = in1(485,:);
x486 = in1(486,:);
x487 = in1(487,:);
x488 = in1(488,:);
x489 = in1(489,:);
x490 = in1(490,:);
x491 = in1(491,:);
x492 = in1(492,:);
x493 = in1(493,:);
x494 = in1(494,:);
x495 = in1(495,:);
x496 = in1(496,:);
x497 = in1(497,:);
x498 = in1(498,:);
x499 = in1(499,:);
x500 = in1(500,:);
x501 = in1(501,:);
x502 = in1(502,:);
x503 = in1(503,:);
x504 = in1(504,:);
x505 = in1(505,:);
x506 = in1(506,:);
x507 = in1(507,:);
x508 = in1(508,:);
x509 = in1(509,:);
x510 = in1(510,:);
x511 = in1(511,:);
x512 = in1(512,:);
x513 = in1(513,:);
x514 = in1(514,:);
x515 = in1(515,:);
x516 = in1(516,:);
x517 = in1(517,:);
x518 = in1(518,:);
x519 = in1(519,:);
x520 = in1(520,:);
x521 = in1(521,:);
x522 = in1(522,:);
x523 = in1(523,:);
x524 = in1(524,:);
x525 = in1(525,:);
x526 = in1(526,:);
x527 = in1(527,:);
x528 = in1(528,:);
x529 = in1(529,:);
x530 = in1(530,:);
x531 = in1(531,:);
x532 = in1(532,:);
x533 = in1(533,:);
x553 = in1(553,:);
x554 = in1(554,:);
x555 = in1(555,:);
x556 = in1(556,:);
x557 = in1(557,:);
x558 = in1(558,:);
x559 = in1(559,:);
x560 = in1(560,:);
x561 = in1(561,:);
x562 = in1(562,:);
x563 = in1(563,:);
x564 = in1(564,:);
x565 = in1(565,:);
x566 = in1(566,:);
x567 = in1(567,:);
x568 = in1(568,:);
x569 = in1(569,:);
x570 = in1(570,:);
x571 = in1(571,:);
x572 = in1(572,:);
x574 = in1(574,:);
c_ineq = [transmission_ankle.*x484-(k.*lf.*x70.*1.0./sqrt(x1.^2+x70.^2).*(x139-sqrt(x1.^2+x70.^2)))./2.0;transmission_ankle.*x485-(k.*lf.*x71.*1.0./sqrt(x2.^2+x71.^2).*(x140-sqrt(x2.^2+x71.^2)))./2.0;transmission_ankle.*x486-(k.*lf.*x72.*1.0./sqrt(x3.^2+x72.^2).*(x141-sqrt(x3.^2+x72.^2)))./2.0;transmission_ankle.*x487-(k.*lf.*x73.*1.0./sqrt(x4.^2+x73.^2).*(x142-sqrt(x4.^2+x73.^2)))./2.0;transmission_ankle.*x488-(k.*lf.*x74.*1.0./sqrt(x5.^2+x74.^2).*(x143-sqrt(x5.^2+x74.^2)))./2.0;transmission_ankle.*x489-(k.*lf.*x75.*1.0./sqrt(x6.^2+x75.^2).*(x144-sqrt(x6.^2+x75.^2)))./2.0;transmission_ankle.*x490-(k.*lf.*x76.*1.0./sqrt(x7.^2+x76.^2).*(x145-sqrt(x7.^2+x76.^2)))./2.0;transmission_ankle.*x491-(k.*lf.*x77.*1.0./sqrt(x8.^2+x77.^2).*(x146-sqrt(x8.^2+x77.^2)))./2.0;transmission_ankle.*x492-(k.*lf.*x78.*1.0./sqrt(x9.^2+x78.^2).*(x147-sqrt(x9.^2+x78.^2)))./2.0;transmission_ankle.*x493-(k.*lf.*x79.*1.0./sqrt(x10.^2+x79.^2).*(x148-sqrt(x10.^2+x79.^2)))./2.0;transmission_ankle.*x494-(k.*lf.*x80.*1.0./sqrt(x11.^2+x80.^2).*(x149-sqrt(x11.^2+x80.^2)))./2.0;transmission_ankle.*x495-(k.*lf.*x81.*1.0./sqrt(x12.^2+x81.^2).*(x150-sqrt(x12.^2+x81.^2)))./2.0;transmission_ankle.*x496-(k.*lf.*x82.*1.0./sqrt(x13.^2+x82.^2).*(x151-sqrt(x13.^2+x82.^2)))./2.0;transmission_ankle.*x497-(k.*lf.*x83.*1.0./sqrt(x14.^2+x83.^2).*(x152-sqrt(x14.^2+x83.^2)))./2.0;transmission_ankle.*x498-(k.*lf.*x84.*1.0./sqrt(x15.^2+x84.^2).*(x153-sqrt(x15.^2+x84.^2)))./2.0;transmission_ankle.*x499-(k.*lf.*x85.*1.0./sqrt(x16.^2+x85.^2).*(x154-sqrt(x16.^2+x85.^2)))./2.0;transmission_ankle.*x500-(k.*lf.*x86.*1.0./sqrt(x17.^2+x86.^2).*(x155-sqrt(x17.^2+x86.^2)))./2.0;transmission_ankle.*x501-(k.*lf.*x87.*1.0./sqrt(x18.^2+x87.^2).*(x156-sqrt(x18.^2+x87.^2)))./2.0;transmission_ankle.*x502-(k.*lf.*x88.*1.0./sqrt(x19.^2+x88.^2).*(x157-sqrt(x19.^2+x88.^2)))./2.0;transmission_ankle.*x503-(k.*lf.*x89.*1.0./sqrt(x20.^2+x89.^2).*(x158-sqrt(x20.^2+x89.^2)))./2.0;transmission_ankle.*x504-(k.*lf.*x90.*1.0./sqrt(x21.^2+x90.^2).*(x159-sqrt(x21.^2+x90.^2)))./2.0;transmission_ankle.*x505-(k.*lf.*x91.*1.0./sqrt(x22.^2+x91.^2).*(x160-sqrt(x22.^2+x91.^2)))./2.0;transmission_ankle.*x506-(k.*lf.*x92.*1.0./sqrt(x23.^2+x92.^2).*(x161-sqrt(x23.^2+x92.^2)))./2.0;transmission_ankle.*x507-(k.*lf.*x93.*1.0./sqrt(x24.^2+x93.^2).*(x162-sqrt(x24.^2+x93.^2)))./2.0;transmission_ankle.*x508-(k.*lf.*x94.*1.0./sqrt(x25.^2+x94.^2).*(x163-sqrt(x25.^2+x94.^2)))./2.0;transmission_ankle.*x509-(k.*lf.*x95.*1.0./sqrt(x26.^2+x95.^2).*(x164-sqrt(x26.^2+x95.^2)))./2.0;transmission_ankle.*x510-(k.*lf.*x96.*1.0./sqrt(x27.^2+x96.^2).*(x165-sqrt(x27.^2+x96.^2)))./2.0;transmission_ankle.*x511-(k.*lf.*x97.*1.0./sqrt(x28.^2+x97.^2).*(x166-sqrt(x28.^2+x97.^2)))./2.0;transmission_ankle.*x512-(k.*lf.*x98.*1.0./sqrt(x29.^2+x98.^2).*(x167-sqrt(x29.^2+x98.^2)))./2.0;transmission_ankle.*x513-(k.*lf.*x99.*1.0./sqrt(x30.^2+x99.^2).*(x168-sqrt(x30.^2+x99.^2)))./2.0;transmission_ankle.*x514-(k.*lf.*x100.*1.0./sqrt(x31.^2+x100.^2).*(x169-sqrt(x31.^2+x100.^2)))./2.0;transmission_ankle.*x515-(k.*lf.*x101.*1.0./sqrt(x32.^2+x101.^2).*(x170-sqrt(x32.^2+x101.^2)))./2.0;transmission_ankle.*x516-(k.*lf.*x102.*1.0./sqrt(x33.^2+x102.^2).*(x171-sqrt(x33.^2+x102.^2)))./2.0;transmission_ankle.*x517-(k.*lf.*x103.*1.0./sqrt(x34.^2+x103.^2).*(x172-sqrt(x34.^2+x103.^2)))./2.0;transmission_ankle.*x518-(k.*lf.*x104.*1.0./sqrt(x35.^2+x104.^2).*(x173-sqrt(x35.^2+x104.^2)))./2.0;transmission_ankle.*x519-(k.*lf.*x105.*1.0./sqrt(x36.^2+x105.^2).*(x174-sqrt(x36.^2+x105.^2)))./2.0;transmission_ankle.*x520-(k.*lf.*x106.*1.0./sqrt(x37.^2+x106.^2).*(x175-sqrt(x37.^2+x106.^2)))./2.0;transmission_ankle.*x521-(k.*lf.*x107.*1.0./sqrt(x38.^2+x107.^2).*(x176-sqrt(x38.^2+x107.^2)))./2.0;transmission_ankle.*x522-(k.*lf.*x108.*1.0./sqrt(x39.^2+x108.^2).*(x177-sqrt(x39.^2+x108.^2)))./2.0;transmission_ankle.*x523-(k.*lf.*x109.*1.0./sqrt(x40.^2+x109.^2).*(x178-sqrt(x40.^2+x109.^2)))./2.0;transmission_ankle.*x524-(k.*lf.*x110.*1.0./sqrt(x41.^2+x110.^2).*(x179-sqrt(x41.^2+x110.^2)))./2.0;transmission_ankle.*x525-(k.*lf.*x111.*1.0./sqrt(x42.^2+x111.^2).*(x180-sqrt(x42.^2+x111.^2)))./2.0;transmission_ankle.*x526-(k.*lf.*x112.*1.0./sqrt(x43.^2+x112.^2).*(x181-sqrt(x43.^2+x112.^2)))./2.0;transmission_ankle.*x527-(k.*lf.*x113.*1.0./sqrt(x44.^2+x113.^2).*(x182-sqrt(x44.^2+x113.^2)))./2.0;transmission_ankle.*x528-(k.*lf.*x114.*1.0./sqrt(x45.^2+x114.^2).*(x183-sqrt(x45.^2+x114.^2)))./2.0;transmission_ankle.*x529-(k.*lf.*x115.*1.0./sqrt(x46.^2+x115.^2).*(x184-sqrt(x46.^2+x115.^2)))./2.0;transmission_ankle.*x530-(k.*lf.*x116.*1.0./sqrt(x47.^2+x116.^2).*(x185-sqrt(x47.^2+x116.^2)))./2.0;transmission_ankle.*x531-(k.*lf.*x117.*1.0./sqrt(x48.^2+x117.^2).*(x186-sqrt(x48.^2+x117.^2)))./2.0;transmission_ankle.*x532-(k.*lf.*x118.*1.0./sqrt(x49.^2+x118.^2).*(x187-sqrt(x49.^2+x118.^2)))./2.0;transmission_ankle.*x533-(k.*lf.*x119.*1.0./sqrt(x50.^2+x119.^2).*(x188-sqrt(x50.^2+x119.^2)))./2.0;-transmission_ankle.*x484-(k.*lf.*x70.*1.0./sqrt(x1.^2+x70.^2).*(x139-sqrt(x1.^2+x70.^2)))./2.0;-transmission_ankle.*x485-(k.*lf.*x71.*1.0./sqrt(x2.^2+x71.^2).*(x140-sqrt(x2.^2+x71.^2)))./2.0;-transmission_ankle.*x486-(k.*lf.*x72.*1.0./sqrt(x3.^2+x72.^2).*(x141-sqrt(x3.^2+x72.^2)))./2.0;-transmission_ankle.*x487-(k.*lf.*x73.*1.0./sqrt(x4.^2+x73.^2).*(x142-sqrt(x4.^2+x73.^2)))./2.0;-transmission_ankle.*x488-(k.*lf.*x74.*1.0./sqrt(x5.^2+x74.^2).*(x143-sqrt(x5.^2+x74.^2)))./2.0;-transmission_ankle.*x489-(k.*lf.*x75.*1.0./sqrt(x6.^2+x75.^2).*(x144-sqrt(x6.^2+x75.^2)))./2.0;-transmission_ankle.*x490-(k.*lf.*x76.*1.0./sqrt(x7.^2+x76.^2).*(x145-sqrt(x7.^2+x76.^2)))./2.0;-transmission_ankle.*x491-(k.*lf.*x77.*1.0./sqrt(x8.^2+x77.^2).*(x146-sqrt(x8.^2+x77.^2)))./2.0;-transmission_ankle.*x492-(k.*lf.*x78.*1.0./sqrt(x9.^2+x78.^2).*(x147-sqrt(x9.^2+x78.^2)))./2.0;-transmission_ankle.*x493-(k.*lf.*x79.*1.0./sqrt(x10.^2+x79.^2).*(x148-sqrt(x10.^2+x79.^2)))./2.0;-transmission_ankle.*x494-(k.*lf.*x80.*1.0./sqrt(x11.^2+x80.^2).*(x149-sqrt(x11.^2+x80.^2)))./2.0;-transmission_ankle.*x495-(k.*lf.*x81.*1.0./sqrt(x12.^2+x81.^2).*(x150-sqrt(x12.^2+x81.^2)))./2.0;-transmission_ankle.*x496-(k.*lf.*x82.*1.0./sqrt(x13.^2+x82.^2).*(x151-sqrt(x13.^2+x82.^2)))./2.0;-transmission_ankle.*x497-(k.*lf.*x83.*1.0./sqrt(x14.^2+x83.^2).*(x152-sqrt(x14.^2+x83.^2)))./2.0;-transmission_ankle.*x498-(k.*lf.*x84.*1.0./sqrt(x15.^2+x84.^2).*(x153-sqrt(x15.^2+x84.^2)))./2.0;-transmission_ankle.*x499-(k.*lf.*x85.*1.0./sqrt(x16.^2+x85.^2).*(x154-sqrt(x16.^2+x85.^2)))./2.0;-transmission_ankle.*x500-(k.*lf.*x86.*1.0./sqrt(x17.^2+x86.^2).*(x155-sqrt(x17.^2+x86.^2)))./2.0;-transmission_ankle.*x501-(k.*lf.*x87.*1.0./sqrt(x18.^2+x87.^2).*(x156-sqrt(x18.^2+x87.^2)))./2.0;-transmission_ankle.*x502-(k.*lf.*x88.*1.0./sqrt(x19.^2+x88.^2).*(x157-sqrt(x19.^2+x88.^2)))./2.0;-transmission_ankle.*x503-(k.*lf.*x89.*1.0./sqrt(x20.^2+x89.^2).*(x158-sqrt(x20.^2+x89.^2)))./2.0;-transmission_ankle.*x504-(k.*lf.*x90.*1.0./sqrt(x21.^2+x90.^2).*(x159-sqrt(x21.^2+x90.^2)))./2.0;-transmission_ankle.*x505-(k.*lf.*x91.*1.0./sqrt(x22.^2+x91.^2).*(x160-sqrt(x22.^2+x91.^2)))./2.0;-transmission_ankle.*x506-(k.*lf.*x92.*1.0./sqrt(x23.^2+x92.^2).*(x161-sqrt(x23.^2+x92.^2)))./2.0;-transmission_ankle.*x507-(k.*lf.*x93.*1.0./sqrt(x24.^2+x93.^2).*(x162-sqrt(x24.^2+x93.^2)))./2.0;-transmission_ankle.*x508-(k.*lf.*x94.*1.0./sqrt(x25.^2+x94.^2).*(x163-sqrt(x25.^2+x94.^2)))./2.0;-transmission_ankle.*x509-(k.*lf.*x95.*1.0./sqrt(x26.^2+x95.^2).*(x164-sqrt(x26.^2+x95.^2)))./2.0;-transmission_ankle.*x510-(k.*lf.*x96.*1.0./sqrt(x27.^2+x96.^2).*(x165-sqrt(x27.^2+x96.^2)))./2.0;-transmission_ankle.*x511-(k.*lf.*x97.*1.0./sqrt(x28.^2+x97.^2).*(x166-sqrt(x28.^2+x97.^2)))./2.0;-transmission_ankle.*x512-(k.*lf.*x98.*1.0./sqrt(x29.^2+x98.^2).*(x167-sqrt(x29.^2+x98.^2)))./2.0;-transmission_ankle.*x513-(k.*lf.*x99.*1.0./sqrt(x30.^2+x99.^2).*(x168-sqrt(x30.^2+x99.^2)))./2.0;-transmission_ankle.*x514-(k.*lf.*x100.*1.0./sqrt(x31.^2+x100.^2).*(x169-sqrt(x31.^2+x100.^2)))./2.0;-transmission_ankle.*x515-(k.*lf.*x101.*1.0./sqrt(x32.^2+x101.^2).*(x170-sqrt(x32.^2+x101.^2)))./2.0;-transmission_ankle.*x516-(k.*lf.*x102.*1.0./sqrt(x33.^2+x102.^2).*(x171-sqrt(x33.^2+x102.^2)))./2.0;-transmission_ankle.*x517-(k.*lf.*x103.*1.0./sqrt(x34.^2+x103.^2).*(x172-sqrt(x34.^2+x103.^2)))./2.0;-transmission_ankle.*x518-(k.*lf.*x104.*1.0./sqrt(x35.^2+x104.^2).*(x173-sqrt(x35.^2+x104.^2)))./2.0;-transmission_ankle.*x519-(k.*lf.*x105.*1.0./sqrt(x36.^2+x105.^2).*(x174-sqrt(x36.^2+x105.^2)))./2.0;-transmission_ankle.*x520-(k.*lf.*x106.*1.0./sqrt(x37.^2+x106.^2).*(x175-sqrt(x37.^2+x106.^2)))./2.0;-transmission_ankle.*x521-(k.*lf.*x107.*1.0./sqrt(x38.^2+x107.^2).*(x176-sqrt(x38.^2+x107.^2)))./2.0;-transmission_ankle.*x522-(k.*lf.*x108.*1.0./sqrt(x39.^2+x108.^2).*(x177-sqrt(x39.^2+x108.^2)))./2.0;-transmission_ankle.*x523-(k.*lf.*x109.*1.0./sqrt(x40.^2+x109.^2).*(x178-sqrt(x40.^2+x109.^2)))./2.0;-transmission_ankle.*x524-(k.*lf.*x110.*1.0./sqrt(x41.^2+x110.^2).*(x179-sqrt(x41.^2+x110.^2)))./2.0;-transmission_ankle.*x525-(k.*lf.*x111.*1.0./sqrt(x42.^2+x111.^2).*(x180-sqrt(x42.^2+x111.^2)))./2.0;-transmission_ankle.*x526-(k.*lf.*x112.*1.0./sqrt(x43.^2+x112.^2).*(x181-sqrt(x43.^2+x112.^2)))./2.0;-transmission_ankle.*x527-(k.*lf.*x113.*1.0./sqrt(x44.^2+x113.^2).*(x182-sqrt(x44.^2+x113.^2)))./2.0;-transmission_ankle.*x528-(k.*lf.*x114.*1.0./sqrt(x45.^2+x114.^2).*(x183-sqrt(x45.^2+x114.^2)))./2.0;-transmission_ankle.*x529-(k.*lf.*x115.*1.0./sqrt(x46.^2+x115.^2).*(x184-sqrt(x46.^2+x115.^2)))./2.0;-transmission_ankle.*x530-(k.*lf.*x116.*1.0./sqrt(x47.^2+x116.^2).*(x185-sqrt(x47.^2+x116.^2)))./2.0;-transmission_ankle.*x531-(k.*lf.*x117.*1.0./sqrt(x48.^2+x117.^2).*(x186-sqrt(x48.^2+x117.^2)))./2.0;-transmission_ankle.*x532-(k.*lf.*x118.*1.0./sqrt(x49.^2+x118.^2).*(x187-sqrt(x49.^2+x118.^2)))./2.0;-transmission_ankle.*x533-(k.*lf.*x119.*1.0./sqrt(x50.^2+x119.^2).*(x188-sqrt(x50.^2+x119.^2)))./2.0;-dthetaMax-((x553-x554).*2.0e1)./x574;-dthetaMax-((x554-x555).*2.0e1)./x574;-dthetaMax-((x555-x556).*2.0e1)./x574;-dthetaMax-((x556-x557).*2.0e1)./x574;-dthetaMax-((x557-x558).*2.0e1)./x574;-dthetaMax-((x558-x559).*2.0e1)./x574;-dthetaMax-((x559-x560).*2.0e1)./x574;-dthetaMax-((x560-x561).*2.0e1)./x574;-dthetaMax-((x561-x562).*2.0e1)./x574;-dthetaMax-((x562-x563).*2.0e1)./x574;-dthetaMax-((x563-x564).*2.0e1)./x574;-dthetaMax-((x564-x565).*2.0e1)./x574;-dthetaMax-((x565-x566).*2.0e1)./x574;-dthetaMax-((x566-x567).*2.0e1)./x574;-dthetaMax-((x567-x568).*2.0e1)./x574;-dthetaMax-((x568-x569).*2.0e1)./x574;-dthetaMax-((x569-x570).*2.0e1)./x574;-dthetaMax-((x570-x571).*2.0e1)./x574;-dthetaMax-((x571-x572).*2.0e1)./x574;-dthetaMax+((x553-x554).*2.0e1)./x574;-dthetaMax+((x554-x555).*2.0e1)./x574;-dthetaMax+((x555-x556).*2.0e1)./x574;-dthetaMax+((x556-x557).*2.0e1)./x574;-dthetaMax+((x557-x558).*2.0e1)./x574;-dthetaMax+((x558-x559).*2.0e1)./x574;-dthetaMax+((x559-x560).*2.0e1)./x574;-dthetaMax+((x560-x561).*2.0e1)./x574;-dthetaMax+((x561-x562).*2.0e1)./x574;-dthetaMax+((x562-x563).*2.0e1)./x574;-dthetaMax+((x563-x564).*2.0e1)./x574;-dthetaMax+((x564-x565).*2.0e1)./x574;-dthetaMax+((x565-x566).*2.0e1)./x574;-dthetaMax+((x566-x567).*2.0e1)./x574;-dthetaMax+((x567-x568).*2.0e1)./x574;-dthetaMax+((x568-x569).*2.0e1)./x574;-dthetaMax+((x569-x570).*2.0e1)./x574;-dthetaMax+((x570-x571).*2.0e1)./x574;-dthetaMax+((x571-x572).*2.0e1)./x574;-x120+x189.*sin(x554);-x121+x190.*sin(x555);-x122+x191.*sin(x556);-x123+x192.*sin(x557);-x124+x193.*sin(x558);-x125+x194.*sin(x559);-x126+x195.*sin(x560);-x127+x196.*sin(x561);-x128+x197.*sin(x562);-x129+x198.*sin(x563);-x130+x199.*sin(x564);-x131+x200.*sin(x565);-x132+x201.*sin(x566);-x133+x202.*sin(x567);-x134+x203.*sin(x568);-x135+x204.*sin(x569);-x136+x205.*sin(x570);-x137+x206.*sin(x571);-x138+x207.*sin(x572)];
