.class Lcom/miui/gallery/ui/PeoplePageFragment$1;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeoplePageFragment;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PeoplePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$1;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$1;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$400(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->DISPLAY_PARTIAL_PEOPLE:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$1;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    sget-object v0, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->DISPLAY_ALL_PEOPLE:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$402(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$1;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$500(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$1;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$400(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->DISPLAY_ALL_PEOPLE:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$1;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    sget-object v0, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->DISPLAY_PARTIAL_PEOPLE:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$402(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$1;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Loader;->forceLoad()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "mode"

    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$1;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$400(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->DISPLAY_ALL_PEOPLE:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    if-ne v1, v2, :cond_2

    const-string v1, "all"

    goto :goto_1

    :cond_2
    const-string v1, "part"

    :goto_1
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "people"

    const-string v1, "people_list_display_mode"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
