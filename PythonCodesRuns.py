import numpy as np

def runs_n(samples, ch, n, k, c=0):
    nrows, ncols = samples.shape

    if k > n:
        return np.zeros(nrows)

    stats = np.zeros((nrows, len(k)))

    for d in range(len(k)):
        if c == 1:
            tpsamples = np.hstack((samples, samples[:, :k[d]-1]))
        else:
            tpsamples = samples

        for i in range(nrows):
            temp = tpsamples[i, :]
            j = k[d]
            no = 0

            while j <= ncols:
                if np.min(temp[j-k[d]:j] == ch) == 1:
                    no += 1
                    j += k[d]
                else:
                    j += 1

            stats[i, d] = no

    return stats

def runs_e(samples, ch, n, k, c=0):
    nrows, ncols = samples.shape

    if k > n:
        return np.zeros(nrows)

    stats = np.zeros((nrows, len(k)))

    for d in range(len(k)):
        if c == 1:
            tpsamples = np.hstack((samples, samples[:, :k[d]-1]))
        else:
            tpsamples = samples

        for i in range(nrows):
            tline1 = tpsamples[i, :]
            j = 1
            ncols_temp = ncols
            no = 0

            if c == 0:
                no = np.min(tline1[:k[d]] == ch) * (tline1[k[d]] != ch)
            elif (tline1[ncols-1] != ch) * np.min(tline1[:k[d]] == ch) * (tline1[k[d]] != ch) == 1:
                no = 1

            while j < ncols_temp - k[d] + 1:
                if np.min(tline1[j:j+k[d]] == ch) * (tline1[j-1] != ch) == 1:
                    no += 1
                    j = j + k[d] + 1
                else:
                    j += 1

            no += np.min(tline1[ncols_temp-k[d]:ncols_temp] == ch) * (tline1[k[d]-1] != ch)
            stats[i, d] = no

    return stats

def runs_g(samples, ch, n, k, c=0):
    nrows, ncols = samples.shape

    if k > n:
        return np.zeros(nrows)

    stats = np.zeros((nrows, len(k)))

    for d in range(len(k)):
        if c == 1:
            tpsamples = np.hstack((samples, samples[:, :k[d]-1]))
        else:
            tpsamples = samples

        for i in range(nrows):
            tline1 = tpsamples[i, :]
            j = k[d]
            no = 0

            while j <= ncols:
                if np.min(tline1[j-k[d]:j] == ch) == 1:
                    no += 1
                    j += k[d]
                else:
                    j += 1

            stats[i, d] = no

    return stats

def runs_m(samples, ch, n, k, c=0):
    nrows, ncols = samples.shape

    if k > n:
        return np.zeros(nrows)

    stats = np.zeros((nrows, len(k)))

    for d in range(len(k)):
        if c == 1:
            tpsamples = np.hstack((samples, samples[:, :k[d]-1]))
        else:
            tpsamples = samples

        for i in range(nrows):
            temp = tpsamples[i, :ncols]
            j = k[d]
            no = 0

            while j <= ncols:
                if np.min(temp[j-k[d]:j] == ch) == 1:
                    no += 1
                j += 1

            stats[i, d] = no

    return stats

def runs_x(samples, ch, n, k, l, c=0):
    nrows, ncols = samples.shape

    stats = np.zeros((nrows, len(k)))

    for d in range(len(k)):
        if c == 1:
            tpsamples = np.hstack((samples, samples[:, :k[d]-1]))
        else:
            tpsamples = samples

        for i in range(nrows):
            tline1 = tpsamples[i, :]
            j = 1
            no = 0

            while j <= ncols - k[d] + 1:
                if np.min(tline1[j:j+k[d]] == ch) == 1:
                    no += 1
                    j = j + k[d] - l[d]
                else:
                    j += 1

            stats[i, d] = no

    return stats
