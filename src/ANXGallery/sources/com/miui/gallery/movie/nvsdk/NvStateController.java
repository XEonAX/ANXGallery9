package com.miui.gallery.movie.nvsdk;

import com.meicam.sdk.NvsRational;
import com.meicam.sdk.NvsStreamingContext;
import com.meicam.sdk.NvsStreamingContext.PlaybackCallback;
import com.meicam.sdk.NvsStreamingContext.PlaybackCallback2;
import com.meicam.sdk.NvsStreamingContext.StreamingEngineCallback;
import com.meicam.sdk.NvsTimeline;
import com.miui.gallery.movie.core.IMovieController;
import com.miui.gallery.movie.core.MovieManager.StateChangeListener;
import com.miui.gallery.util.Log;
import io.reactivex.android.schedulers.AndroidSchedulers;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

public class NvStateController implements PlaybackCallback, PlaybackCallback2, StreamingEngineCallback, IMovieController {
    private NvsRational mNvsRational = new NvsRational(3, 4);
    private CopyOnWriteArrayList<StateChangeListener> mStateChangeListeners;
    private NvsStreamingContext mStreamingContext;
    private NvsTimeline mTimeline;

    public NvStateController(NvsStreamingContext nvsStreamingContext, NvsTimeline nvsTimeline) {
        this.mStreamingContext = nvsStreamingContext;
        this.mTimeline = nvsTimeline;
    }

    private int getCurrentEngineState() {
        return this.mStreamingContext.getStreamingEngineState();
    }

    private int getStateFromNvEngine(int i) {
        if (i == 0) {
            return 2;
        }
        switch (i) {
            case 3:
                return 1;
            case 4:
                return 3;
            case 5:
                return 200;
            default:
                return -500;
        }
    }

    public static /* synthetic */ void lambda$onPlaybackEOF$145(NvStateController nvStateController) {
        Iterator it = nvStateController.mStateChangeListeners.iterator();
        while (it.hasNext()) {
            ((StateChangeListener) it.next()).onPlaybackEOF();
        }
    }

    private void seekLong(long j) {
        this.mStreamingContext.seekTimeline(this.mTimeline, j, this.mNvsRational, 0);
    }

    public void addStateChangeListener(StateChangeListener stateChangeListener) {
        if (stateChangeListener != null) {
            if (this.mStateChangeListeners == null) {
                this.mStateChangeListeners = new CopyOnWriteArrayList<>();
            }
            if (!this.mStateChangeListeners.contains(stateChangeListener)) {
                this.mStateChangeListeners.add(stateChangeListener);
            }
        }
    }

    public void cancelExport() {
        Log.d("NvStateController", "cancelExport");
        if (getCurrentEngineState() == 5) {
            this.mStreamingContext.stop(2);
        }
        Log.d("NvStateController", "cancelExport done");
    }

    public boolean isResume() {
        return getCurrentEngineState() == 4 || getCurrentEngineState() == 0;
    }

    public void onFirstVideoFramePresented(NvsTimeline nvsTimeline) {
        Iterator it = this.mStateChangeListeners.iterator();
        while (it.hasNext()) {
            ((StateChangeListener) it.next()).onPlaybackPreloadingCompletion();
        }
    }

    public void onPause() {
        pause();
    }

    public void onPlaybackEOF(NvsTimeline nvsTimeline) {
        AndroidSchedulers.mainThread().createWorker().schedule(new Runnable() {
            public final void run() {
                NvStateController.lambda$onPlaybackEOF$145(NvStateController.this);
            }
        });
    }

    public void onPlaybackPreloadingCompletion(NvsTimeline nvsTimeline) {
    }

    public void onPlaybackStopped(NvsTimeline nvsTimeline) {
    }

    public void onPlaybackTimelinePosition(NvsTimeline nvsTimeline, long j) {
        Iterator it = this.mStateChangeListeners.iterator();
        while (it.hasNext()) {
            ((StateChangeListener) it.next()).onPlaybackTimeChanged((int) (j / 1000));
        }
    }

    public void onResume() {
    }

    public void onStreamingEngineStateChanged(int i) {
        Log.d("NvStateController", "state: %d", (Object) Integer.valueOf(i));
        int stateFromNvEngine = getStateFromNvEngine(i);
        Iterator it = this.mStateChangeListeners.iterator();
        while (it.hasNext()) {
            ((StateChangeListener) it.next()).onStateChanged(stateFromNvEngine);
        }
    }

    public void pause() {
        if (getCurrentEngineState() != 5) {
            this.mStreamingContext.stop(2);
        }
    }

    public void pauseOrResume() {
        if (getCurrentEngineState() == 4 || getCurrentEngineState() == 0) {
            resume();
        } else {
            pause();
        }
    }

    public void play() {
        play(this.mStreamingContext.getTimelineCurrentPosition(this.mTimeline));
    }

    public void play(long j) {
        this.mStreamingContext.playbackTimeline(this.mTimeline, j, this.mTimeline.getDuration(), this.mNvsRational, true, 0);
    }

    public void removeStateChangeListener(StateChangeListener stateChangeListener) {
        if (this.mStateChangeListeners != null) {
            this.mStateChangeListeners.remove(stateChangeListener);
        }
    }

    public void replay() {
        play(0);
    }

    public void resume() {
        if (getCurrentEngineState() != 3) {
            this.mStreamingContext.playbackTimeline(this.mTimeline, this.mStreamingContext.getTimelineCurrentPosition(this.mTimeline), this.mTimeline.getDuration(), this.mNvsRational, true, 0);
        }
    }

    public void seek(int i) {
        seekLong((long) (i * 1000));
    }
}
