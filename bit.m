syms snr
M_ary = 64;
eqn = (2*(sqrt(M_ary)-1)/sqrt(M_ary)*log(M_ary)).* erfc(sqrt(3.*snr*log(M_ary)/(2*(M_ary*1)))) == 10^(10^-2);
S = solve(eqn,snr)