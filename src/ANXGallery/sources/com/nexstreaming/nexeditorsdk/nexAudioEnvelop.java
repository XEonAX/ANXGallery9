package com.nexstreaming.nexeditorsdk;

import com.nexstreaming.app.common.util.f;
import com.nexstreaming.nexeditorsdk.exception.InvalidRangeException;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexAudioEnvelopOf;
import java.util.ArrayList;

public final class nexAudioEnvelop implements Cloneable {
    private static final int maxIndex = 65536;
    private int[] m_cachedLevelList;
    private int[] m_cachedTimeList;
    private boolean m_modify = true;
    private int m_totalTime;
    private int m_trimEndTime;
    private int m_trimStartTime;
    private ArrayList<Integer> m_volumeEnvelopeLevel;
    private ArrayList<Integer> m_volumeEnvelopeTime;

    private nexAudioEnvelop() {
    }

    nexAudioEnvelop(nexClip nexclip) {
        this.m_totalTime = nexclip.getTotalTime();
        this.m_trimStartTime = 0;
        this.m_trimEndTime = nexclip.getTotalTime();
    }

    nexAudioEnvelop(nexAudioEnvelopOf nexaudioenvelopof) {
        this.m_volumeEnvelopeLevel = nexaudioenvelopof.m_volumeEnvelopeLevel;
        this.m_volumeEnvelopeTime = nexaudioenvelopof.m_volumeEnvelopeTime;
        this.m_totalTime = nexaudioenvelopof.m_totalTime;
        this.m_trimStartTime = nexaudioenvelopof.m_trimStartTime;
        this.m_trimEndTime = nexaudioenvelopof.m_trimEndTime;
    }

    protected static nexAudioEnvelop clone(nexAudioEnvelop nexaudioenvelop) {
        nexAudioEnvelop nexaudioenvelop2;
        try {
            nexaudioenvelop2 = (nexAudioEnvelop) nexaudioenvelop.clone();
            try {
                nexaudioenvelop2.m_volumeEnvelopeTime = nexaudioenvelop.m_volumeEnvelopeTime;
                nexaudioenvelop2.m_volumeEnvelopeLevel = nexaudioenvelop.m_volumeEnvelopeLevel;
                nexaudioenvelop2.m_cachedTimeList = nexaudioenvelop.m_cachedTimeList;
                nexaudioenvelop2.m_cachedLevelList = nexaudioenvelop.m_cachedLevelList;
            } catch (CloneNotSupportedException e) {
                e = e;
            }
        } catch (CloneNotSupportedException e2) {
            e = e2;
            nexaudioenvelop2 = null;
            e.printStackTrace();
            return nexaudioenvelop2;
        }
        return nexaudioenvelop2;
    }

    private int findTime2Index(int i, int i2) {
        int i3 = 0;
        if (this.m_volumeEnvelopeLevel == null) {
            this.m_volumeEnvelopeLevel = new ArrayList<>();
            this.m_volumeEnvelopeLevel.add(0, Integer.valueOf(100));
            this.m_volumeEnvelopeLevel.add(1, Integer.valueOf(100));
        }
        if (this.m_volumeEnvelopeTime == null) {
            this.m_volumeEnvelopeTime = new ArrayList<>();
            this.m_volumeEnvelopeTime.add(0, Integer.valueOf(0));
            this.m_volumeEnvelopeTime.add(1, Integer.valueOf(this.m_totalTime));
            return 1;
        }
        int size = this.m_volumeEnvelopeTime.size();
        while (true) {
            if (i3 >= this.m_volumeEnvelopeTime.size()) {
                break;
            }
            int intValue = ((Integer) this.m_volumeEnvelopeTime.get(i3)).intValue();
            if (intValue == i) {
                size = i3 + 65536;
                this.m_volumeEnvelopeLevel.set(i3, Integer.valueOf(i2));
                break;
            } else if (intValue > i) {
                size = i3;
                break;
            } else {
                i3++;
            }
        }
        return size;
    }

    private int getProjectDuration() {
        return this.m_trimEndTime - this.m_trimStartTime;
    }

    private int[] getVolumeEnvelopeList(boolean z) {
        if (this.m_modify) {
            this.m_modify = false;
            if (this.m_volumeEnvelopeLevel != null) {
                ArrayList arrayList = new ArrayList(this.m_volumeEnvelopeLevel.size() + 2);
                ArrayList arrayList2 = new ArrayList(this.m_volumeEnvelopeLevel.size() + 2);
                int i = 0;
                int i2 = 0;
                int i3 = 0;
                while (true) {
                    if (i >= this.m_volumeEnvelopeLevel.size()) {
                        break;
                    }
                    int volumeEnvelopeTimeAdj = getVolumeEnvelopeTimeAdj(i);
                    int volumeEnvelopeLevel = getVolumeEnvelopeLevel(i);
                    int projectDuration = getProjectDuration();
                    boolean z2 = this.m_totalTime == this.m_trimEndTime;
                    if (volumeEnvelopeTimeAdj <= projectDuration && volumeEnvelopeTimeAdj > 0) {
                        arrayList.add(Integer.valueOf(volumeEnvelopeTimeAdj));
                        arrayList2.add(Integer.valueOf(volumeEnvelopeLevel));
                    } else if (volumeEnvelopeTimeAdj > projectDuration || volumeEnvelopeLevel <= 0 || volumeEnvelopeTimeAdj != 0) {
                        if (volumeEnvelopeTimeAdj > projectDuration && !z2) {
                            int i4 = (int) (((((float) (projectDuration - i2)) / ((float) (volumeEnvelopeTimeAdj - i2))) * ((float) (volumeEnvelopeLevel - i3))) + ((float) i3));
                            arrayList.add(Integer.valueOf(projectDuration));
                            arrayList2.add(Integer.valueOf(i4));
                            break;
                        }
                    } else {
                        arrayList.add(Integer.valueOf(volumeEnvelopeTimeAdj));
                        arrayList2.add(Integer.valueOf(volumeEnvelopeLevel));
                    }
                    i++;
                    i2 = volumeEnvelopeTimeAdj;
                    i3 = volumeEnvelopeLevel;
                }
                this.m_cachedTimeList = f.a(arrayList);
                this.m_cachedLevelList = f.a(arrayList2);
            } else {
                this.m_cachedTimeList = null;
                this.m_cachedLevelList = null;
            }
        }
        return z ? this.m_cachedTimeList : this.m_cachedLevelList;
    }

    public int addVolumeEnvelope(int i, int i2) {
        if (i < 0) {
            throw new InvalidRangeException(0, this.m_totalTime, i);
        } else if (i2 > 200 || i2 < 0) {
            throw new InvalidRangeException(0, 200, i2);
        } else {
            int findTime2Index = findTime2Index(i, i2);
            this.m_modify = true;
            if (findTime2Index >= 65536) {
                return findTime2Index - 65536;
            }
            this.m_volumeEnvelopeTime.add(findTime2Index, Integer.valueOf(i));
            this.m_volumeEnvelopeLevel.add(findTime2Index, Integer.valueOf(i2));
            return findTime2Index;
        }
    }

    public void changeVolumeLevelValue(int i, int i2) {
        if (i > this.m_volumeEnvelopeLevel.size() - 1) {
            throw new InvalidRangeException(0, this.m_volumeEnvelopeLevel.size() - 1, i);
        } else if (i2 > 200 || i2 < 0) {
            throw new InvalidRangeException(0, 200, i2);
        } else {
            this.m_volumeEnvelopeLevel.set(i, Integer.valueOf(i2));
            this.m_modify = true;
        }
    }

    /* access modifiers changed from: 0000 */
    public nexAudioEnvelopOf getSaveData() {
        nexAudioEnvelopOf nexaudioenvelopof = new nexAudioEnvelopOf();
        nexaudioenvelopof.m_volumeEnvelopeLevel = this.m_volumeEnvelopeLevel;
        nexaudioenvelopof.m_volumeEnvelopeTime = this.m_volumeEnvelopeTime;
        nexaudioenvelopof.m_totalTime = this.m_totalTime;
        nexaudioenvelopof.m_trimStartTime = this.m_trimStartTime;
        nexaudioenvelopof.m_trimEndTime = this.m_trimEndTime;
        return nexaudioenvelopof;
    }

    public int getVolumeEnvelopeLength() {
        return this.m_volumeEnvelopeTime.size();
    }

    public int getVolumeEnvelopeLevel(int i) {
        if (i > this.m_volumeEnvelopeLevel.size() - 1) {
            throw new InvalidRangeException(0, this.m_volumeEnvelopeLevel.size() - 1, i);
        } else if (this.m_volumeEnvelopeLevel == null) {
            return -1;
        } else {
            return ((Integer) this.m_volumeEnvelopeLevel.get(i)).intValue();
        }
    }

    public int[] getVolumeEnvelopeLevelList() {
        return getVolumeEnvelopeList(false);
    }

    public int getVolumeEnvelopeTime(int i) {
        if (i > this.m_volumeEnvelopeTime.size() - 1) {
            throw new InvalidRangeException(0, this.m_volumeEnvelopeTime.size() - 1, i);
        } else if (this.m_volumeEnvelopeTime == null) {
            return -1;
        } else {
            return ((Integer) this.m_volumeEnvelopeTime.get(i)).intValue();
        }
    }

    public int getVolumeEnvelopeTimeAdj(int i) {
        if (i > this.m_volumeEnvelopeTime.size() - 1) {
            throw new InvalidRangeException(0, this.m_volumeEnvelopeTime.size() - 1, i);
        } else if (this.m_volumeEnvelopeTime == null) {
            return -1;
        } else {
            return ((Integer) this.m_volumeEnvelopeTime.get(i)).intValue() - this.m_trimStartTime;
        }
    }

    public int[] getVolumeEnvelopeTimeList() {
        return getVolumeEnvelopeList(true);
    }

    public void removeVolumeEnvelop() {
        if (this.m_volumeEnvelopeTime != null) {
            this.m_volumeEnvelopeTime.clear();
        }
        if (this.m_volumeEnvelopeLevel != null) {
            this.m_volumeEnvelopeLevel.clear();
        }
        this.m_modify = true;
    }

    public void removeVolumeEnvelop(int i) {
        if (i <= this.m_volumeEnvelopeLevel.size() - 1) {
            this.m_volumeEnvelopeTime.remove(i);
            this.m_volumeEnvelopeLevel.remove(i);
            this.m_modify = true;
            return;
        }
        throw new InvalidRangeException(0, this.m_volumeEnvelopeLevel.size() - 1, i);
    }

    public void updateTrimTime(int i, int i2) {
        if (i2 <= i) {
            throw new InvalidRangeException(i, i2);
        } else if (i >= 0) {
            this.m_trimStartTime = i;
            this.m_trimEndTime = i2;
            this.m_modify = true;
        } else {
            throw new InvalidRangeException(0, this.m_totalTime, i);
        }
    }
}
