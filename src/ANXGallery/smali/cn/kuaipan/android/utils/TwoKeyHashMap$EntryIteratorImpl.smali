.class Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;
.super Ljava/lang/Object;
.source "TwoKeyHashMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/kuaipan/android/utils/TwoKeyHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EntryIteratorImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "Ljava/lang/String;",
        "TV;>;>;"
    }
.end annotation


# instance fields
.field private curr:I

.field private curr_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry<",
            "TE;TK;TV;>;"
        }
    .end annotation
.end field

.field private found:Z

.field private returned_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry<",
            "TE;TK;TV;>;"
        }
    .end annotation
.end field

.field private returned_index:I

.field private startModCount:I

.field final synthetic this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;


# direct methods
.method constructor <init>(Lcn/kuaipan/android/utils/TwoKeyHashMap;)V
    .locals 1

    iput-object p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr:I

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->returned_index:I

    invoke-static {p1}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$300(Lcn/kuaipan/android/utils/TwoKeyHashMap;)I

    move-result p1

    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->startModCount:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 3

    iget-boolean v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->found:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iget-object v0, v0, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iput-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    :cond_1
    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    if-nez v0, :cond_3

    :goto_0
    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr:I

    add-int/2addr v0, v1

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr:I

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr:I

    iget-object v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {v2}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$400(Lcn/kuaipan/android/utils/TwoKeyHashMap;)[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object v2

    array-length v2, v2

    if-ge v0, v2, :cond_2

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {v0}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$400(Lcn/kuaipan/android/utils/TwoKeyHashMap;)[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object v0

    iget v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr:I

    aget-object v0, v0, v2

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr:I

    iget-object v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {v2}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$400(Lcn/kuaipan/android/utils/TwoKeyHashMap;)[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object v2

    array-length v2, v2

    if-ge v0, v2, :cond_3

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {v0}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$400(Lcn/kuaipan/android/utils/TwoKeyHashMap;)[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object v0

    iget v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr:I

    aget-object v0, v0, v2

    iput-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    :cond_3
    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    if-eqz v0, :cond_4

    goto :goto_1

    :cond_4
    const/4 v1, 0x0

    :goto_1
    iput-boolean v1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->found:Z

    return v1
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {v0}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$300(Lcn/kuaipan/android/utils/TwoKeyHashMap;)I

    move-result v0

    iget v1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->startModCount:I

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->found:Z

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr:I

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->returned_index:I

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iput-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->returned_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->curr_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    :cond_1
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 5

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->returned_index:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {v0}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$300(Lcn/kuaipan/android/utils/TwoKeyHashMap;)I

    move-result v0

    iget v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->startModCount:I

    if-ne v0, v2, :cond_2

    const/4 v0, 0x0

    iget-object v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {v2}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$400(Lcn/kuaipan/android/utils/TwoKeyHashMap;)[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object v2

    iget v3, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->returned_index:I

    aget-object v2, v2, v3

    :goto_0
    move-object v4, v2

    move-object v2, v0

    move-object v0, v4

    iget-object v3, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->returned_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    if-eq v0, v3, :cond_0

    iget-object v2, v0, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_1

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->returned_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iget-object v0, v0, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iput-object v0, v2, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {v0}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$400(Lcn/kuaipan/android/utils/TwoKeyHashMap;)[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object v0

    iget v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->returned_index:I

    iget-object v3, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->returned_entry:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iget-object v3, v3, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aput-object v3, v0, v2

    :goto_1
    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {v0}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$010(Lcn/kuaipan/android/utils/TwoKeyHashMap;)I

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->this$0:Lcn/kuaipan/android/utils/TwoKeyHashMap;

    invoke-static {v0}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->access$308(Lcn/kuaipan/android/utils/TwoKeyHashMap;)I

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->startModCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->startModCount:I

    iput v1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;->returned_index:I

    return-void

    :cond_2
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method
