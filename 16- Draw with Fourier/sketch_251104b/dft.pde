ArrayList<FourierPoint> dft(ArrayList<PVector> x) {
  ArrayList<FourierPoint> X = new ArrayList<FourierPoint>();
  int N = x.size();

  for (int k = 0; k < N; k++) {
    Complex sum = new Complex(0, 0);

    for (int n = 0; n < N; n++) {
      float phi = (TWO_PI * k * n) / N;
      Complex c = new Complex(cos(phi), -sin(phi));

      PVector p = x.get(n);
      Complex point = new Complex(p.x, p.y);
      Complex product = point.mult(c);
      sum = sum.add(product);
    }

    sum.re = sum.re / N;
    sum.im = sum.im / N;

    int freq = k <= N/2 ? k : k - N;
    float amp = sqrt(sum.re * sum.re + sum.im * sum.im);
    float phase = atan2(sum.im, sum.re);

    X.add(new FourierPoint(sum.re, sum.im, freq, amp, phase));
  }

  return X;
}
