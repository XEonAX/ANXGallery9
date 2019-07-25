package com.miui.gallery.assistant.jni.score;

public class QualityScore {
    private double iqaBala;
    private double iqaBlur;
    private double iqaBlurType;
    private double iqaComp;
    private double iqaExpo;
    private double iqaHaze;
    private double iqaNima;
    private double iqaNois;
    private double iqaSatu;

    public QualityScore(double[] dArr) {
        if (dArr != null && dArr.length >= 9) {
            this.iqaExpo = dArr[0];
            this.iqaSatu = dArr[1];
            this.iqaBala = dArr[2];
            this.iqaHaze = dArr[3];
            this.iqaNois = dArr[4];
            this.iqaBlur = dArr[5];
            this.iqaComp = dArr[6];
            this.iqaNima = dArr[7];
            this.iqaBlurType = dArr[8];
        }
    }

    public double getIqaBala() {
        return this.iqaBala;
    }

    public double getIqaBlur() {
        return this.iqaBlur;
    }

    public double getIqaBlurType() {
        return this.iqaBlurType;
    }

    public double getIqaComp() {
        return this.iqaComp;
    }

    public double getIqaExpo() {
        return this.iqaExpo;
    }

    public double getIqaHaze() {
        return this.iqaHaze;
    }

    public double getIqaNima() {
        return this.iqaNima;
    }

    public double getIqaNois() {
        return this.iqaNois;
    }

    public double getIqaSatu() {
        return this.iqaSatu;
    }
}
