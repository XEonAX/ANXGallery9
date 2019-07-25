package com.miui.gallery.search.core.query;

import android.database.ContentObserver;
import android.database.DataSetObserver;
import android.os.Handler;
import com.miui.gallery.search.SearchConstants;
import com.miui.gallery.search.core.Consumer;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.QueryInfo.Builder;
import com.miui.gallery.search.core.context.SearchContext;
import com.miui.gallery.search.core.context.TaskExecutor;
import com.miui.gallery.search.core.result.SourceResult;
import com.miui.gallery.search.core.source.Source;
import com.miui.gallery.search.utils.SearchLog;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class QueryPackageHelper {

    private static class BatchQueryTask implements ControllableTask<QueryResult> {
        /* access modifiers changed from: private */
        public boolean mIsCancelled = false;
        /* access modifiers changed from: private */
        public Handler mPublishHandler;
        /* access modifiers changed from: private */
        public final QueryInfo mQueryInfo;
        /* access modifiers changed from: private */
        public QueryResult mQueryResult;
        private Consumer<SourceResult> mQueryTaskReceiver = new Consumer<SourceResult>() {
            public boolean consume(SourceResult sourceResult) {
                if (BatchQueryTask.this.mIsCancelled) {
                    return false;
                }
                if (sourceResult != null) {
                    ArrayList arrayList = new ArrayList();
                    arrayList.add(sourceResult);
                    boolean addSourceResults = BatchQueryTask.this.mQueryResult.addSourceResults(arrayList);
                    if (addSourceResults && BatchQueryTask.this.mReceiveSourceUpdates) {
                        sourceResult.registerDataSetObserver(new SourceResultDataSetObserver(sourceResult));
                        sourceResult.registerContentObserver(new SourceResultContentObserver(sourceResult));
                    }
                    Source source = sourceResult.getSource();
                    if (source != null) {
                        int indexOf = BatchQueryTask.this.mSources.indexOf(source);
                        if (indexOf >= 0) {
                            BatchQueryTask.this.mQueryTasks[indexOf] = null;
                        }
                        if (sourceResult.getResultExtras() != null && sourceResult.getResultExtras().getBoolean("need_requery", false)) {
                            if (BatchQueryTask.this.mIsCancelled) {
                                return false;
                            }
                            Builder cloneFrom = new Builder().cloneFrom(BatchQueryTask.this.mQueryInfo);
                            cloneFrom.removeParam("use_persistent_response");
                            QueryTask queryTask = new QueryTask(cloneFrom.build(), source, BatchQueryTask.this.mRequeryTaskReceiver, BatchQueryTask.this.mPublishHandler, 1);
                            BatchQueryTask.this.mQueryTasks[BatchQueryTask.this.mSources.size() + indexOf] = queryTask;
                            BatchQueryTask.this.mTaskExecutor.submit(queryTask);
                            SearchLog.d("QueryPackageHelper", "Submit requery task, source: [%s]", source.getName());
                        }
                    }
                    return addSourceResults;
                }
                throw new RuntimeException("Receive a null source result!");
            }
        };
        /* access modifiers changed from: private */
        public QueryTask[] mQueryTasks;
        /* access modifiers changed from: private */
        public final boolean mReceiveSourceUpdates;
        /* access modifiers changed from: private */
        public Consumer<SourceResult> mRequeryTaskReceiver = new Consumer<SourceResult>() {
            public boolean consume(SourceResult sourceResult) {
                if (BatchQueryTask.this.mIsCancelled) {
                    return false;
                }
                if (sourceResult != null) {
                    Source source = sourceResult.getSource();
                    if (source != null) {
                        int indexOf = BatchQueryTask.this.mSources.indexOf(source);
                        if (indexOf >= 0) {
                            BatchQueryTask.this.mQueryTasks[BatchQueryTask.this.mSources.size() + indexOf] = null;
                        }
                    }
                    if (sourceResult.getErrorInfo() != null && SearchConstants.isErrorStatus(sourceResult.getErrorInfo().getErrorStatus())) {
                        return false;
                    }
                    ArrayList arrayList = new ArrayList();
                    arrayList.add(sourceResult);
                    boolean addSourceResults = BatchQueryTask.this.mQueryResult.addSourceResults(arrayList);
                    if (addSourceResults && BatchQueryTask.this.mReceiveSourceUpdates) {
                        sourceResult.registerDataSetObserver(new SourceResultDataSetObserver(sourceResult));
                        sourceResult.registerContentObserver(new SourceResultContentObserver(sourceResult));
                    }
                    return addSourceResults;
                }
                throw new RuntimeException("Receive a null source result!");
            }
        };
        /* access modifiers changed from: private */
        public final List<Source> mSources;
        /* access modifiers changed from: private */
        public final TaskExecutor<QueryTask> mTaskExecutor;

        private class SourceResultContentObserver extends ContentObserver {
            private final WeakReference<SourceResult> mSourceResultWeakReference;

            public SourceResultContentObserver(SourceResult sourceResult) {
                super(BatchQueryTask.this.mPublishHandler);
                this.mSourceResultWeakReference = new WeakReference<>(sourceResult);
            }

            public void onChange(boolean z) {
                if (this.mSourceResultWeakReference.get() != null && !BatchQueryTask.this.mIsCancelled) {
                    BatchQueryTask.this.onSourceResultChanged((SourceResult) this.mSourceResultWeakReference.get());
                }
            }
        }

        private class SourceResultDataSetObserver extends DataSetObserver {
            private final WeakReference<SourceResult> mSourceResultWeakReference;

            public SourceResultDataSetObserver(SourceResult sourceResult) {
                this.mSourceResultWeakReference = new WeakReference<>(sourceResult);
            }

            public void onChanged() {
                if (this.mSourceResultWeakReference.get() != null && !BatchQueryTask.this.mIsCancelled) {
                    BatchQueryTask.this.onSourceResultChanged((SourceResult) this.mSourceResultWeakReference.get());
                }
            }

            public void onInvalidated() {
            }
        }

        public BatchQueryTask(final QueryInfo queryInfo, List<Source> list, TaskExecutor<QueryTask> taskExecutor, boolean z) {
            this.mQueryInfo = queryInfo;
            this.mSources = list;
            if (this.mSources.size() > 1) {
                Collections.sort(this.mSources, new Comparator<Source>() {
                    public int compare(Source source, Source source2) {
                        return -SearchConstants.comparePriority(source.getPriority(queryInfo), source2.getPriority(queryInfo));
                    }
                });
            }
            this.mTaskExecutor = taskExecutor;
            this.mReceiveSourceUpdates = z;
        }

        /* access modifiers changed from: private */
        public void onSourceResultChanged(SourceResult sourceResult) {
            Source source = sourceResult.getSource();
            if (source != null) {
                int indexOf = this.mSources.indexOf(source);
                if (indexOf >= 0) {
                    querySource(indexOf, false);
                    return;
                }
                return;
            }
            SearchLog.w("QueryPackageHelper", "Couldn't re-query without source! [%s]", sourceResult);
        }

        private void querySource(int i, boolean z) {
            QueryTask queryTask = this.mQueryTasks[i];
            if (queryTask != null) {
                this.mTaskExecutor.cancel(queryTask);
            }
            QueryTask queryTask2 = new QueryTask(this.mQueryInfo, (Source) this.mSources.get(i), this.mQueryTaskReceiver, this.mPublishHandler, z ^ true ? 1 : 0);
            this.mTaskExecutor.submit(queryTask2);
            this.mQueryTasks[i] = queryTask2;
        }

        private void releasePublishHandler() {
            if (this.mPublishHandler != null) {
                SearchContext.getInstance().releasePublishHandler();
                this.mPublishHandler = null;
            }
        }

        public void cancel() {
            SearchLog.d("QueryPackageHelper", "Cancel batch query task for query [%s]", this.mQueryInfo);
            this.mIsCancelled = true;
            if (this.mQueryTasks != null) {
                for (QueryTask cancel : this.mQueryTasks) {
                    this.mTaskExecutor.cancel(cancel);
                }
            }
            releasePublishHandler();
        }

        /* access modifiers changed from: protected */
        public void finalize() throws Throwable {
            releasePublishHandler();
        }

        public QueryResult getResult() {
            return this.mQueryResult;
        }

        public boolean isCanceled() {
            return this.mIsCancelled;
        }

        public void start() {
            if (!this.mIsCancelled) {
                this.mPublishHandler = SearchContext.getInstance().acquirePublishHandler();
                this.mQueryTasks = new QueryTask[(this.mSources.size() * 2)];
                this.mQueryResult = new QueryResult(this.mQueryInfo, this.mSources);
                for (int i = 0; i < this.mSources.size(); i++) {
                    querySource(i, true);
                }
                return;
            }
            throw new IllegalStateException("Call start() after cancel()!");
        }

        public boolean started() {
            return this.mQueryResult != null;
        }
    }

    public static ControllableTask<QueryResult> getQueryResult(QueryInfo queryInfo, boolean z) {
        SearchContext instance = SearchContext.getInstance();
        List matchedSources = instance.getMatchedSources(queryInfo);
        if (matchedSources != null) {
            return new BatchQueryTask(queryInfo, matchedSources, instance.getQueryTaskExecutor(), z);
        }
        SearchLog.e("QueryPackageHelper", "No matched source for query info %s", queryInfo);
        return null;
    }
}
