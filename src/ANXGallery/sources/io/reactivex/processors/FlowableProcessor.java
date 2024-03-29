package io.reactivex.processors;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import org.reactivestreams.Processor;

public abstract class FlowableProcessor<T> extends Flowable<T> implements FlowableSubscriber<T>, Processor<T, T> {
}
