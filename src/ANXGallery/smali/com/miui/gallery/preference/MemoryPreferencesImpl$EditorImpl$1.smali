.class Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl$1;
.super Ljava/lang/Object;
.source "MemoryPreferencesImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl;->notifyListeners(Ljava/util/Set;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl;

.field final synthetic val$keysModified:Ljava/util/List;

.field final synthetic val$listeners:Ljava/util/Set;


# direct methods
.method constructor <init>(Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl;Ljava/util/List;Ljava/util/Set;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl$1;->this$1:Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl;

    iput-object p2, p0, Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl$1;->val$keysModified:Ljava/util/List;

    iput-object p3, p0, Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl$1;->val$listeners:Ljava/util/Set;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl$1;->val$keysModified:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl$1;->val$keysModified:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl$1;->val$listeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    if-eqz v3, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl$1;->this$1:Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl;

    iget-object v4, v4, Lcom/miui/gallery/preference/MemoryPreferencesImpl$EditorImpl;->this$0:Lcom/miui/gallery/preference/MemoryPreferencesImpl;

    invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    return-void
.end method
