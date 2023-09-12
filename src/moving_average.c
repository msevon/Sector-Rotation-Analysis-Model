#include <stdio.h>

void calculateMovingAverage(double* data, int dataSize, int maPeriod, double* result) {
    for (int i = maPeriod - 1; i < dataSize; i++) {
        double sum = 0;
        for (int j = i - (maPeriod - 1); j <= i; j++) {
            sum += data[j];
        }
        result[i] = sum / maPeriod;
    }
}
