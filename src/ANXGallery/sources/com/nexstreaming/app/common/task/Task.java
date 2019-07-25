package com.nexstreaming.app.common.task;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.Pair;
import android.util.SparseArray;
import java.lang.ref.WeakReference;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicBoolean;

public class Task {
    public static final Task COMPLETED_TASK = new Task(Event.COMPLETE, Event.SUCCESS);
    public static final int INVALID_TASK_ID = 0;
    public static final TaskError NO_RESULT_AVAILABLE = new TaskError() {
        public Exception getException() {
            return null;
        }

        public String getLocalizedMessage(Context context) {
            return getMessage();
        }

        public String getMessage() {
            return "No result available";
        }
    };
    public static final TaskError TIMEOUT = new TaskError() {
        public Exception getException() {
            return null;
        }

        public String getLocalizedMessage(Context context) {
            return getMessage();
        }

        public String getMessage() {
            return "Timeout";
        }
    };
    public static final TaskError UNKNOWN_ERROR = new TaskError() {
        public Exception getException() {
            return null;
        }

        public String getLocalizedMessage(Context context) {
            return getMessage();
        }

        public String getMessage() {
            return "Unknown";
        }
    };
    private static SparseArray<WeakReference<Task>> sIntIdTaskMap = new SparseArray<>();
    private static Map<Long, WeakReference<Task>> sLongIdTaskMap = new HashMap();
    private static long sLongTaskId = ((SystemClock.uptimeMillis() & -1) << 32);
    private static int sRegisterCount = 0;
    private static int sTaskId;
    private AtomicBoolean mCancelRequested;
    private boolean mCancellable;
    /* access modifiers changed from: private */
    public Handler mHandler;
    private CountDownLatch mLatch;
    private List<Pair<OnTaskEventListener, Event>> mListeners;
    private final long mLongTaskId;
    private int mMaxProgress;
    private int mProgress;
    private boolean mProgressSignalled;
    private boolean mRegistered;
    private EnumSet<Event> mSignalledEvents;
    private TaskError mTaskError;
    private final int mTaskId;
    /* access modifiers changed from: private */
    public Runnable mTimeoutRunnable;

    public enum Event {
        SUCCESS,
        FAIL,
        COMPLETE,
        CANCEL,
        PROGRESS,
        RESULT_AVAILABLE,
        UPDATE_OR_RESULT_AVAILABLE
    }

    public static class MultiplexTask extends Task {
        final Task[] tasks;

        public interface OnAllTasksSignalledListener {
            void onAllTasksSignalled(MultiplexTask multiplexTask, Task[] taskArr, Event event);
        }

        private MultiplexTask(Task[] taskArr) {
            this.tasks = taskArr;
        }

        public Task[] getTasks() {
            return this.tasks;
        }

        public Task onAllTasksSignalled(final OnAllTasksSignalledListener onAllTasksSignalledListener) {
            return onEvent(Event.COMPLETE, new OnTaskEventListener() {
                public void onTaskEvent(Task task, Event event) {
                    onAllTasksSignalledListener.onAllTasksSignalled(MultiplexTask.this, MultiplexTask.this.tasks, event);
                }
            });
        }
    }

    public interface OnFailListener {
        void onFail(Task task, Event event, TaskError taskError);
    }

    public interface OnProgressListener {
        void onProgress(Task task, Event event, int i, int i2);
    }

    public interface OnTaskEventListener {
        void onTaskEvent(Task task, Event event);
    }

    public static class ProgressNotAvailableException extends RuntimeException {
        private static final long serialVersionUID = 1;

        public ProgressNotAvailableException() {
        }

        public ProgressNotAvailableException(String str) {
            super(str);
        }

        public ProgressNotAvailableException(String str, Throwable th) {
            super(str, th);
        }

        public ProgressNotAvailableException(Throwable th) {
            super(th);
        }
    }

    public static class SimpleTaskError implements TaskError {
        private final Exception mException;
        private final String mMessage;

        public SimpleTaskError(Exception exc, String str) {
            this.mException = exc;
            this.mMessage = str;
        }

        public Exception getException() {
            return this.mException;
        }

        public String getLocalizedMessage(Context context) {
            return this.mMessage != null ? this.mMessage : this.mException.getLocalizedMessage() != null ? this.mException.getLocalizedMessage() : this.mException.getMessage() != null ? this.mException.getMessage() : "Unknown";
        }

        public String getMessage() {
            return this.mMessage != null ? this.mMessage : this.mException.getMessage() != null ? this.mException.getMessage() : "Unknown";
        }

        public String toString() {
            if (getException() != null) {
                StringBuilder sb = new StringBuilder();
                sb.append("<SimpleTaskError: ");
                sb.append(getException().getClass().getName());
                sb.append(">");
                return sb.toString();
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append("<SimpleTaskError: ");
            sb2.append(getMessage());
            sb2.append(">");
            return sb2.toString();
        }
    }

    public interface TaskError {
        Exception getException();

        String getLocalizedMessage(Context context);

        String getMessage();
    }

    public static class TaskErrorException extends Exception {
        private static final long serialVersionUID = 1;
        private final TaskError taskError;

        public TaskErrorException(TaskError taskError2) {
            super(taskError2.getMessage());
            this.taskError = taskError2;
        }

        public TaskErrorException(TaskError taskError2, Throwable th) {
            super(taskError2.getMessage(), th);
            this.taskError = taskError2;
        }

        public TaskError getTaskError() {
            return this.taskError;
        }
    }

    public Task() {
        this.mListeners = new LinkedList();
        this.mSignalledEvents = EnumSet.noneOf(Event.class);
        this.mProgress = 0;
        this.mMaxProgress = 0;
        this.mProgressSignalled = false;
        this.mRegistered = false;
        this.mTaskError = null;
        this.mCancellable = false;
        this.mHandler = null;
        this.mTimeoutRunnable = null;
        this.mLatch = null;
        sTaskId++;
        sLongTaskId++;
        if (sTaskId == 0) {
            sTaskId++;
        }
        if (sLongTaskId == 0) {
            sLongTaskId++;
        }
        this.mTaskId = sTaskId;
        this.mLongTaskId = sLongTaskId;
    }

    private Task(Event... eventArr) {
        this();
        signalEvent(eventArr);
    }

    public static Task combinedTask(Collection<? extends Task> collection) {
        final Task task = new Task();
        final ArrayList<Task> arrayList = new ArrayList<>(collection);
        for (Task task2 : arrayList) {
            task2.onProgress(new OnProgressListener() {
                public void onProgress(Task task, Event event, int i, int i2) {
                    Iterator it = arrayList.iterator();
                    boolean z = false;
                    int i3 = 0;
                    int i4 = 0;
                    while (true) {
                        if (!it.hasNext()) {
                            z = true;
                            break;
                        }
                        Task task2 = (Task) it.next();
                        if (!task2.isProgressAvailable()) {
                            break;
                        }
                        i3 += task2.getProgress();
                        i4 += task2.getMaxProgress();
                    }
                    if (z) {
                        task.setProgress(i3, i4);
                    }
                }
            });
            task2.onComplete(new OnTaskEventListener() {
                public void onTaskEvent(Task task, Event event) {
                    boolean z;
                    Iterator it = arrayList.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            if (!((Task) it.next()).didSignalEvent(Event.COMPLETE)) {
                                z = false;
                                break;
                            }
                        } else {
                            z = true;
                            break;
                        }
                    }
                    if (z) {
                        task.signalEvent(Event.COMPLETE);
                    }
                }
            });
            task2.onSuccess(new OnTaskEventListener() {
                public void onTaskEvent(Task task, Event event) {
                    boolean z;
                    Iterator it = arrayList.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            if (!((Task) it.next()).didSignalEvent(Event.SUCCESS)) {
                                z = false;
                                break;
                            }
                        } else {
                            z = true;
                            break;
                        }
                    }
                    if (z) {
                        task.signalEvent(Event.SUCCESS);
                    }
                }
            });
            task2.onFailure((OnFailListener) new OnFailListener(task) {
                final /* synthetic */ Task a;

                {
                    this.a = r1;
                }

                public void onFail(Task task, Event event, TaskError taskError) {
                    this.a.sendFailure(taskError);
                }
            });
        }
        return task;
    }

    public static Task findTaskById(int i) {
        WeakReference weakReference = (WeakReference) sIntIdTaskMap.get(i);
        if (weakReference == null) {
            return null;
        }
        return (Task) weakReference.get();
    }

    public static Task findTaskByLongId(long j) {
        WeakReference weakReference = (WeakReference) sLongIdTaskMap.get(Long.valueOf(j));
        if (weakReference == null) {
            return null;
        }
        return (Task) weakReference.get();
    }

    public static Task makeFailedTask(TaskError taskError) {
        Task task = new Task();
        task.sendFailure(taskError);
        return task;
    }

    public static Task makeFailedTask(Exception exc) {
        Task task = new Task();
        task.sendFailure(new SimpleTaskError(exc, null));
        return task;
    }

    public static Task makeFailedTask(String str) {
        Task task = new Task();
        task.sendFailure(new SimpleTaskError(null, str));
        return task;
    }

    public static Task makeFailedTask(String str, Exception exc) {
        Task task = new Task();
        task.sendFailure(new SimpleTaskError(exc, str));
        return task;
    }

    public static TaskError makeTaskError(Exception exc) {
        return new SimpleTaskError(exc, null);
    }

    public static TaskError makeTaskError(String str) {
        return new SimpleTaskError(null, str);
    }

    public static TaskError makeTaskError(String str, Exception exc) {
        return new SimpleTaskError(exc, str);
    }

    private void signalCompletionEvent() {
        if (this.mLatch != null) {
            this.mLatch.countDown();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00b1, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x00b6, code lost:
        return;
     */
    private synchronized void signalOneEvent(Event event) {
        if (event != null) {
            if (!didSignalEvent(event)) {
                if (didSignalEvent(Event.CANCEL)) {
                    Log.w("Task", "Ingoring attempt to signal a cancelled task.");
                } else if (event != Event.FAIL || !didSignalEvent(Event.SUCCESS)) {
                    if (event == Event.COMPLETE && !didSignalEvent(Event.SUCCESS) && !didSignalEvent(Event.FAIL) && !didSignalEvent(Event.CANCEL)) {
                        signalOneEvent(Event.SUCCESS);
                    }
                    if (!isRepeatableEvent(event)) {
                        this.mSignalledEvents.add(event);
                    }
                    ArrayList<Pair> arrayList = new ArrayList<>(8);
                    for (Pair pair : this.mListeners) {
                        if (pair.second == event) {
                            arrayList.add(pair);
                        }
                    }
                    if (!isRepeatableEvent(event)) {
                        this.mListeners.removeAll(arrayList);
                    }
                    for (Pair pair2 : arrayList) {
                        ((OnTaskEventListener) pair2.first).onTaskEvent(this, event);
                    }
                    if (event == Event.COMPLETE || event == Event.FAIL || event == Event.CANCEL) {
                        signalCompletionEvent();
                    }
                } else {
                    Log.w("Task", "Ingoring attempt to signal failure on task that already succeeded.");
                }
            }
        }
    }

    public static MultiplexTask waitForAll(final Task... taskArr) {
        final MultiplexTask multiplexTask = new MultiplexTask(taskArr);
        final Event[] eventArr = new Event[taskArr.length];
        for (int i = 0; i < taskArr.length; i++) {
            eventArr[i] = null;
        }
        AnonymousClass4 r1 = new OnTaskEventListener() {
            public void onTaskEvent(Task task, Event event) {
                Event event2;
                Event event3 = Event.COMPLETE;
                int i = 0;
                while (true) {
                    if (i >= taskArr.length) {
                        break;
                    } else if (taskArr[i] == task) {
                        eventArr[i] = event;
                        break;
                    } else {
                        i++;
                    }
                }
                int i2 = 0;
                while (i2 < taskArr.length) {
                    if (eventArr[i2] != null) {
                        if (eventArr[i2] == Event.FAIL) {
                            event2 = Event.FAIL;
                        } else {
                            if (eventArr[i2] == Event.CANCEL && event3 == Event.COMPLETE) {
                                event2 = Event.CANCEL;
                            }
                            i2++;
                        }
                        event3 = event2;
                        i2++;
                    } else {
                        return;
                    }
                }
                multiplexTask.signalEvent(event3);
            }
        };
        for (Task task : taskArr) {
            task.onEvent(Event.COMPLETE, r1);
            task.onEvent(Event.FAIL, r1);
            task.onEvent(Event.CANCEL, r1);
        }
        return multiplexTask;
    }

    public Task awaitTaskCompletion() {
        if (this.mLatch == null) {
            throw new RuntimeException("Not a waitable task");
        } else if (Looper.getMainLooper().getThread() != Thread.currentThread()) {
            boolean z = false;
            while (true) {
                try {
                    this.mLatch.await();
                    break;
                } catch (InterruptedException unused) {
                    z = true;
                } catch (Throwable th) {
                    if (z) {
                        Thread.currentThread().interrupt();
                    }
                    throw th;
                }
            }
            if (z) {
                Thread.currentThread().interrupt();
            }
            return this;
        } else {
            throw new RuntimeException("Would block on UI thread");
        }
    }

    public void cancel() {
        if (this.mCancellable) {
            this.mCancelRequested.set(true);
            return;
        }
        throw new RuntimeException("Not a cancellable task");
    }

    public boolean didSignalEvent(Event event) {
        return this.mSignalledEvents.contains(event);
    }

    public long getLongTaskId() {
        return this.mLongTaskId;
    }

    public int getMaxProgress() {
        if (this.mProgressSignalled) {
            return this.mMaxProgress;
        }
        throw new ProgressNotAvailableException();
    }

    public int getProgress() {
        if (this.mProgressSignalled) {
            return this.mProgress;
        }
        throw new ProgressNotAvailableException();
    }

    public TaskError getTaskError() {
        if (didSignalEvent(Event.FAIL)) {
            return this.mTaskError == null ? UNKNOWN_ERROR : this.mTaskError;
        }
        throw new RuntimeException("Error not available (task did not fail)");
    }

    public int getTaskId() {
        return this.mTaskId;
    }

    public boolean isCancelRequested() {
        if (this.mCancellable) {
            return this.mCancelRequested.get();
        }
        throw new RuntimeException("Not a cancellable task");
    }

    public boolean isCancellable() {
        return this.mCancellable;
    }

    public boolean isComplete() {
        return didSignalEvent(Event.COMPLETE);
    }

    public boolean isProgressAvailable() {
        return this.mProgressSignalled;
    }

    public boolean isRepeatableEvent(Event event) {
        return event == Event.PROGRESS || event == Event.UPDATE_OR_RESULT_AVAILABLE;
    }

    public boolean isRunning() {
        return !didSignalEvent(Event.COMPLETE) && !didSignalEvent(Event.FAIL) && !didSignalEvent(Event.CANCEL);
    }

    public synchronized void makeWaitable() {
        if (this.mLatch == null) {
            this.mLatch = new CountDownLatch(1);
        }
        if (!isRunning()) {
            signalCompletionEvent();
        }
    }

    public Task onCancel(OnTaskEventListener onTaskEventListener) {
        return onEvent(Event.CANCEL, onTaskEventListener);
    }

    public Task onComplete(OnTaskEventListener onTaskEventListener) {
        return onEvent(Event.COMPLETE, onTaskEventListener);
    }

    public Task onEvent(Event event, OnTaskEventListener onTaskEventListener) {
        if (event == null || onTaskEventListener == null) {
            return this;
        }
        if (didSignalEvent(event)) {
            onTaskEventListener.onTaskEvent(this, event);
            return this;
        }
        this.mListeners.add(new Pair(onTaskEventListener, event));
        return this;
    }

    public Task onFailure(final OnFailListener onFailListener) {
        return onEvent(Event.FAIL, new OnTaskEventListener() {
            public void onTaskEvent(Task task, Event event) {
                onFailListener.onFail(task, event, Task.this.getTaskError());
            }
        });
    }

    public Task onFailure(final Task task) {
        if (task != this) {
            return onEvent(Event.FAIL, new OnTaskEventListener() {
                public void onTaskEvent(Task task, Event event) {
                    task.sendFailure(Task.this.getTaskError());
                }
            });
        }
        throw new InvalidParameterException();
    }

    public Task onProgress(final OnProgressListener onProgressListener) {
        return onEvent(Event.PROGRESS, new OnTaskEventListener() {
            public void onTaskEvent(Task task, Event event) {
                onProgressListener.onProgress(task, event, Task.this.getProgress(), Task.this.getMaxProgress());
            }
        });
    }

    public Task onSuccess(OnTaskEventListener onTaskEventListener) {
        return onEvent(Event.SUCCESS, onTaskEventListener);
    }

    public void register() {
        if (!this.mRegistered) {
            sIntIdTaskMap.put(this.mTaskId, new WeakReference(this));
            sLongIdTaskMap.put(Long.valueOf(this.mLongTaskId), new WeakReference(this));
            sRegisterCount++;
            if (sRegisterCount > 32) {
                ArrayList<Integer> arrayList = new ArrayList<>();
                int size = sIntIdTaskMap.size();
                for (int i = 0; i < size; i++) {
                    int keyAt = sIntIdTaskMap.keyAt(i);
                    WeakReference weakReference = (WeakReference) sIntIdTaskMap.valueAt(i);
                    if (weakReference == null || weakReference.get() == null) {
                        arrayList.add(Integer.valueOf(keyAt));
                    }
                }
                for (Integer intValue : arrayList) {
                    sIntIdTaskMap.remove(intValue.intValue());
                }
                ArrayList<Long> arrayList2 = new ArrayList<>();
                for (Entry entry : sLongIdTaskMap.entrySet()) {
                    if (entry.getValue() == null || ((WeakReference) entry.getValue()).get() == null) {
                        arrayList2.add(entry.getKey());
                    }
                }
                for (Long remove : arrayList2) {
                    sLongIdTaskMap.remove(remove);
                }
                sRegisterCount = 0;
            }
            this.mRegistered = true;
        }
    }

    public synchronized void removeListenerForFail() {
        ArrayList arrayList = new ArrayList(8);
        for (Pair pair : this.mListeners) {
            if (pair.second == Event.FAIL) {
                arrayList.add(pair);
            }
        }
        this.mListeners.removeAll(arrayList);
    }

    public void sendFailure(TaskError taskError) {
        setTaskError(taskError);
        signalEvent(Event.FAIL);
    }

    public void setCancellable(boolean z) {
        this.mCancellable = z;
        if (this.mCancellable && this.mCancelRequested == null) {
            this.mCancelRequested = new AtomicBoolean(false);
        } else if (!this.mCancellable) {
            this.mCancelRequested = null;
        }
    }

    public void setProgress(int i, int i2) {
        this.mProgress = i;
        this.mMaxProgress = i2;
        this.mProgressSignalled = true;
        signalOneEvent(Event.PROGRESS);
    }

    public void setTaskError(TaskError taskError) {
        this.mTaskError = taskError;
    }

    public Task setTimeout(long j) {
        if (this.mHandler == null) {
            this.mHandler = new Handler();
        }
        if (this.mTimeoutRunnable == null) {
            this.mTimeoutRunnable = new Runnable() {
                public void run() {
                    if (Task.this.isRunning()) {
                        Task.this.sendFailure(Task.TIMEOUT);
                    }
                    Task.this.mTimeoutRunnable = null;
                    Task.this.mHandler = null;
                }
            };
        } else {
            this.mHandler.removeCallbacks(this.mTimeoutRunnable);
        }
        this.mHandler.postDelayed(this.mTimeoutRunnable, j);
        return this;
    }

    public void signalEvent(Event... eventArr) {
        for (Event event : eventArr) {
            if (event != Event.PROGRESS) {
                signalOneEvent(event);
            }
        }
    }

    public String toString() {
        String str = "";
        Iterator it = this.mSignalledEvents.iterator();
        boolean z = true;
        while (it.hasNext()) {
            Event event = (Event) it.next();
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(z ? "" : ",");
            sb.append(event.name());
            str = sb.toString();
            z = false;
        }
        if (str.length() < 1) {
            str = "none";
        }
        if (this.mProgressSignalled) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("[Task ");
            sb2.append(this.mTaskId);
            sb2.append(": progress=");
            sb2.append(this.mProgress);
            sb2.append("/");
            sb2.append(this.mMaxProgress);
            sb2.append(" events=");
            sb2.append(str);
            sb2.append("]");
            return sb2.toString();
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("[Task ");
        sb3.append(this.mTaskId);
        sb3.append(": events=");
        sb3.append(str);
        sb3.append("]");
        return sb3.toString();
    }
}
