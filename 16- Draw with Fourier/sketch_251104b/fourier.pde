class FourierPoint {
  float re, im;
  int freq;
  float amp;
  float phase;

  FourierPoint(float re, float im, int freq, float amp, float phase) {
    this.re = re;
    this.im = im;
    this.freq = freq;
    this.amp = amp;
    this.phase = phase;
  }
}

class Complex {
  float re, im;

  Complex(float a, float b) {
    re = a;
    im = b;
  }

  Complex add(Complex c) {
    return new Complex(re + c.re, im + c.im);
  }

  Complex mult(Complex c) {
    return new Complex(re * c.re - im * c.im, re * c.im + im * c.re);
  }
}
