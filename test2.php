<?php
add_stylesheet('<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">', -100);
add_stylesheet('<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">', -100);
echo '<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://kit.fontawesome.com/cd6c1c6007.js" crossorigin="anonymous"></script>';
?>

<style>

    .modal_main {    
        /* modal 스크롤 */
        width: 50%;
        height: 90%;
        overflow-x: hidden;
        overflow-y: auto;
        position: fixed;
        margin-left: -50px;
        text-align: start;
        position: absolute;
        top: 30px;
        right: 2%;
        padding: 10px;
    }

    .modal_main::-webkit-scrollbar{
        width:5px;
    }
    .modal_main::-webkit-scrollbar-thumb {
        background-color: rgba(0,0,0,.3);
        border-radius: 2px
    }
   

    .modal_profile-picture {
        
    }


    .modal_make_heart {
        margin: 0 auto;
        width: 20px;
        height: 20px;
        background: #ea2027;
        position: relative; /*부모*/
        top: -35px;
        left: 50px;
        transform: rotate(45deg); /*회전*/
    }

    .modal_make_heart:before, .modal_make_heart:after {
        content: "";
        width: 20px;
        height: 20px;
        position: absolute; /*자식*/
        border-radius: 50%; /*둥글게*/
        background: #ea2027;    
    }

    .modal_make_heart:before {
        left: -50%; /*왼쪽으로 -50%*/
    }
    
    .modal_make_heart:after {
        top: -50%; /*위쪽으로 -50%*/ 
    }

    .modal_header {
        margin-top: 10px;
        font-size: 20px;
        font-weight: bold;
    }

    .modal_container {
        padding-top: 10px;
        padding-bottom: 30px;
    }

    .modal_tag {    
        border: 1px solid #000;
        border-radius: 20px;
        text-align: center;
        padding: 4px 6px;
        float: left;
        margin: 3px;
        margin-bottom: 10px;
        font-size: 14px;
        line-height:14px;
    }


    .cmts2 img, .cmts img{
        width: 50px;
        margin-right: 10px;
        text-align: center;
        vertical-align: middle;
        border: 1px solid rgb(223, 196, 200);
        box-shadow: #ddd 1px 1px 1px 1px;
        border-radius: 30px;
    }
    .cmts, .cmts2{
        border-top: 1px solid #ccc;
        padding-top: 10px;
    }
    .cmt_contents{
        margin: 10px;
    }
    .cmt_contents2{
        margin: 10px 10px 10px 40px;
    }

    .modal_commit {    
        width: auto;    
    }
    .modal-commits{
        /* margin-top:-40px; */
        /* display: inline; */
        /* width: 400px; */
    }

    .modal-commit-name {
        position: relative;
        top: -42px;
        right: -78px;
        margin-bottom: 20px;
        width: 150px;
    }

    .modal-commit-name2 {
        position: relative;
        top: 5px;
        right: -100px;
        margin-bottom: 20px;
        width: 150px;
        margin-bottom: 20px;
    }

    .modal-commit-L {
        position: relative;
        font-size: 64px;
        top: 50px;
        left: 50px;
    }

    .modal-commit-data {
        font-size: 10px;
    }

    .modal_commit-num {
        color: rgb(255, 115, 0);
    }

    .modal_commit-top {
        width: 30px;
        margin-top: 70px;
    }


    .modal_commit-box {
        width: 500px;
        height: 40px;
        border-radius: 10px;
    }

    .modal_commit-text {
        position: relative;
        top: -50px;
        right: -69px;
        width: 450px;
        margin: 10px;
    }

    .modal_commit-text2 {
        position: relative;
        left: 141px;
        width: 350px;
    }

    .modal_commit-under {
        margin: 10px;
        width: 390px;
        position: relative;
        left: 130px;
    }

    .modal-commit-data {
        position: relative;
        width: 100px;
        right: -80px;
        top: -58px;
        /* width: 300px; */
    }

    .modal-commit-data2 {
        position: relative;
        width: 100px;
        right: -140px;
        top: 1px;
        font-size: 10px;
    }

    .modal-commit-like {
        position: relative;
        top: -73px;
        right: -184px;
        font-size: 10px;
        width: 31px;
    }
    .modal-commit-like2 {
        position: relative;
        top: -13px;
        right: -244px;
        font-size: 10px;
        width: 31px;
    }

    .modal_commit-submit {
        border-radius: 10px;
        width: 40px;
        height: 40px;
        position: relative;
        top: -42px;
        right: -507px;
    }

    .modal_commit-submit:hover {
        background-color: aquamarine;
    }

    .modal_commit-submit:active {
        background-color: aqua;
    }

    #class {
        position: fixed;
    }

    .pop_wrap {
        position:fixed;  
        background:rgba(0,0,0,.5); 
        font-size:0; 
        text-align:center;
    }
    .pop_wrap:after {
        display:inline-block; 
        height:100%; 
        vertical-align:middle; 
        content:'';
    }
    .pop_wrap .pop_inner{
        display:inline-block;
        padding:20px 30px; 
        background:#fff; 
        width:200px; 
        vertical-align:middle; 
        font-size:15px;
    }

    i {
        position: relative;
        top: 5px;
        left: 90%;    
        color: white;
        background: rgba(0, 0, 0, 0.1);
        padding: 10px;
        border-radius: 5px;    
    }

    i:hover {
        background: rgba(0, 0, 0, 0.3);
    }

    .wrap {
        padding:10px;
    }

    .pop_wrap {
        position:fixed; 
        top:0; 
        left:0; 
        right:0; 
        bottom:0; 
        background:rgba(0,0,0,.5); 
        font-size:0; 
        text-align:center;
    }
    .pop_wrap:after {
        display:inline-block; 
        height:100%; 
        vertical-align:middle; 
        content:'';
    }

    .background {    
        height: 100vh;
        z-index: 1000;    
        /* 숨기기 */
        z-index: -1;
        opacity: 0;
    }

    /* 모달팝업 스크린 */
    #slider-wrap {
        width: 1100px;
        height: 750px;
        position: relative;
        overflow: hidden;
    }

    /* 취소 버튼 */
    .btn_close {
        width: 50px;
        line-height: 20px;
        font-size: 20px;
        position: absolute;
        top: 1%;
        left: 95%;    
        text-align: center;    
        border-radius: 7px;
        color: #eee;
        z-index: 100;
        -webkit-transition: all 0.1s ease;
        -o-transition: all 0.1s ease;
        transition: all 0.1s ease;
    }
    .slider {
        position: relative;
    }

    .slider img{
        width: 500px;
        height: 500px;
        object-fit: contain;
    }

</style>


<div id="pop<?=$row['wr_id']?>" class="pop_wrap" style="visibility: hidden; z-index:5000;">
    <div class="pop_inner" class="background pop_wrap" id="slider-wrap">
        <div style="margin-top: 11vh;">
        <?php
            //게시글 이미지(개행 시 비어있는 공간 나옴)
            $cimgs_tail_pos = strpos($write['wr_content'],"<br");
            $cimgs_substred = substr($write['wr_content'],3,$cimgs_tail_pos);
            $cimgs_substred = explode(">",$cimgs_substred);
            array_pop($cimgs_substred);
            $cimgs_substred = implode(">",$cimgs_substred);
            //게시글 이미지 슬라이드
            echo "<div class='slider'>";
            //영상(유튜브)주소 전체 입력 가능
            if($write['wr_2']!=''){
                $murl = $write['wr_2'];
                if (preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/\s]{11})%i', $murl, $mmatch)) {
                    $mid = $mmatch[1];
                }
                $mwidth = '800px';
                $mheight = '450px';
                echo '<iframe id="ytplayer" type="text/html" width="'.$mwidth.'" height="'.$mheight.'"
                src="https://www.youtube.com/embed/'.$mid.'?rel=0&showinfo=0&color=white&iv_load_policy=3"
                frameborder="0" allowfullscreen></iframe>';
            }
            echo $cimgs_substred."></div>";
        ?>
        </div>
        <div class="modal_main">
            <!-- 작성자 -->
            <div class="bd_lst_profile" style="text-align:left;">
                <div class="img">
                    <form action="<?=G5_SHOP_URL?>/feed.php" method="post">
                        <input type="hidden" name="user_name" value="<?=$row_member['mb_nick']?>">
                        <input type="hidden" name="user_id" value="<?=$row_member['mb_id']?>">
                        <button type="submit" onclick="javascript: form.action='<?=G5_SHOP_URL?>/feed.php';"><?php echo get_member_profile_img($row_member['mb_id']); ?></button>
                    </form>
                    <!-- <a class="pc_pro_btn js_pro_btn_user"></a> -->
                </div>
                <div class="txt_box">
                    <div class="name_line">
                        <!--작성자-->
                        <a href="/bbs/board.php?bo_table=0101&wr_id=<?=$row['wr_id']?>" class="t1 tov"><?php echo $row_member['mb_nick'] ?></a>
                        <!-- 팔로우 -->
                        <button type="button" class="js_test lst_f" onclick="go_flow('<?=$row['mb_id']?>',<?=$i?>);" id="js_test_<?=$i?>" name="js_test_<?=$i?>" style="<?if(!$check['fol_id']){?>color:#ff4a4a<?}else{?><?}?>"><?if(!$check['fol_id']){?>팔로우<?}else{?>팔로잉<?}?></button>
                        <!-- act클래스 추가 -->
                    </div>
                    <!-- <p class="t2 tov"><?=$row_member['mb_profile']?></p> -->
                </div>
            </div>
            
            <div>
                <!-- 게시글 내용 -->
                <h1 class="modal_header"><?=$row['wr_subject']?></h1>
                <p style='font-size:10px; color:gray;'><?=$row['wr_datetime']?></p>
                <div class="modal_container"><?=nl2br($row['wr_3'])?></div>
                <div style="width: 64vh; line-height: 40px;">
                    <?php
                        $ctags = explode(",",$row['wr_1']);
                        $ctags = "<div class='modal_tag'>#".implode("</div><div class='modal_tag'>#",$ctags)."</div>";
                        echo $ctags;
                        // echo $member['mb_level'];
                    ?>
                </div>

                <div class="gall_ico_line cb" style="clear:both;">
                    <!-- 좋아요 체크 -->
                
                    <?php 
                        $qry2 = " select * from g5_board_good where wr_id = '".$row['wr_id']."' and bo_table = '0101' and mb_id = '".$member['mb_id']."' ";
                        $row2 = sql_fetch($qry2);
                        {
                    ?>

                    <button type="button" class="js_good_<?=$row['wr_id']?> fl" onclick="go_good('<?=$member['mb_id']?>','<?=$row['wr_id']?>','0101','<?=$row['wr_id']?>','<?=$row['wr_good']?>');" id="js_good_<?=$i?>" name="js_good_<?=$i?>"><span class="heart fl txt <?php if(count($row2)>= 1 and $row2['mb_id'] == $member['mb_id']) echo "act"?>"> <span class="num"><?=$row['wr_good']?></span></span></button>

                    <!-- 좋아요 버튼 -->
                        <script>
                            function go_good(mb_id , wr_id, bd ,i,good){
                                <?php if(!$member['mb_id']){ ?>
                                    alert('로그인 후 이용 바랍니다.');
                                <?}else{?>
                                        var str = good;
                                        str = parseInt(good);
                                        str_p = str + 1;
                                        str_d = str_p - 1;

                                        $.ajax({
                                            url:'/bbs/ajax.good.php',
                                            data : {
                                                'mb_id':mb_id , 
                                                'wr_id':wr_id , 
                                                'bd':bd,
                                                },
                                            type:'POST',
                                            dataType:'json',
                                            success:function(data){
                                                if(data == 1){
                                                    $(".js_good_"+i).find(".num").text(str_p);
                                                    $(".js_good_"+i).find("span").addClass('act');

                                                }else if(data == 2){
                                                    $(".js_good_"+i).find(".num").text(str_d);
                                                    $(".js_good_"+i).find("span").removeClass('act');
                                                    location.reload();
                                                }
                                            },error:function(request,status,error){
                //                                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                            }
                                        });

                                <?}?>
                            }

                        </script>

                    <?php } ?>
                    <!-- 좋아요 체크 끝 -->

                    <a href="/bbs/board.php?bo_table=0101&wr_id=<?=$row['wr_id']?>"><span class="comment fl txt"><?=$row['wr_comment']?><?php if($row['wr_comment'] > 9999) echo "+" ?></span></a>
                    <?php
                    //스크랩 sql

                    $sql3 = " select count(*) as cnt from {$g5['scrap_table']}
                    where mb_id = '{$member['mb_id']}'
                    and bo_table = '0101'
                    and wr_id = '{$row['wr_id']}' ";
                        $row3 = sql_fetch($sql3);
                        {
                        if ($row3['cnt']) {
                        
                    ?>
                    <a href="<?=G5_BBS_URL?>/scrap_popin.php?bo_table=0101&wr_id=<?=$row['wr_id']?>" target="_blank" onclick="win_scrap(this.href); return false;" class="cut fr txt <?php if ($row3['cnt']) echo "act" ?> "></a>
                        <?php }else{ ?>
                    <a href="<?=G5_BBS_URL?>/scrap_popin.php?bo_table=0101&wr_id=<?=$row['wr_id']?>" target="_blank" onclick="win_scrap(this.href); return false;" class="cut fr txt "></a>
                        <?php } ?>
                    <?php } ?>
                </div>
            
                <div style="margin-top:-50px;">
                    <!-- 댓글 내용 -->
                    <div class="modal_commit-top">
                        <div style="font-weight:bold; border-bottom:3px solid #ff4a4a; padding:3px; width:40px;">댓글</div>
                    </div>
                    <div></div>
                    <hr style="border-bottom: 2px solid rgb(255, 166, 0) !important; width: 30px !important;">                        
                    <hr style="border: 1px solid #ddd; margin-top: 0.1mm !important; margin-bottom: 10px !important;">
                    <div class="modal_commit">
                    <?php
                        $write_table = 'g5_write_0101';
                        $wr_id = $row['wr_id'];
                        include(G5_BBS_PATH.'/test_comment.php');
                        $cmt_amt = count($clist);
                        for ($cci=0; $cci<$cmt_amt; $cci++) {
                            $comment_id = $clist[$cci]['wr_id'];
                            $cmt_depth = strlen($clist[$cci]['wr_comment_reply']) * 50;
                            $comment = nl2br($clist[$cci]['wr_content']);
                            // $csql_member = " SELECT * FROM g5_member WHERE mb_nick = '".$clist[$cci]['wr_name']."' ";
                            // $crow_member = sql_fetch($csql_member);
                            $cmt_rp = "";
                            $cmt_rp_class = "";
                            if($clist[$cci]['wr_comment_reply']!=''){
                                $cmt_rp = "<span modal-commit-L style='display:inline-block; width:20px; height:30px; border-left:1px solid #bbb; border-bottom:1px solid #bbb; margin:5px;'></span>";
                                $cmt_rp_class = "2";
                            }
                            echo "<div class='cmts".$cmt_rp_class."'>";
                            echo $cmt_rp;
                            echo get_member_profile_img($clist[$cci]['mb_id']);
                            echo "<div style='display:inline-block; font-weight:bold;'>".$clist[$cci]['wr_name']."</div>";
                            echo "<div style='display:inline-block; font-size:10px; color:gray; margin-left:3px;'>".$clist[$cci]['wr_datetime']."</div>";
                            // echo "<div class='modal-commits'>";
                            echo "<div class='cmt_contents".$cmt_rp_class."'>".$comment."</div>";
                            echo "</div>";
                            echo "<hr style='border: 1px solid #ddd !important;'>";
                        }
                    ?>
                    </div>
                </div>
            </div>
        </div>
        <i class=" btn_close fa-solid fa-circle-xmark close"></i>
    </div>
</div>

<script>
    $(document).ready(function(){
        $('.slider').bxSlider({
            // 슬라이드 너비
            slideWidth: 450,
        });
    });

    var target = document.querySelectorAll('.btn_open');
    var slider_target = document.querySelectorAll('.slider li');
    var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
    var targetID;



    //$('#pop_info').show();

    // 팝업 열기
    for(var i = 0; i < target.length; i++){
    target[i].addEventListener('click', function(){
        targetID = this.getAttribute('href');
        document.querySelector(targetID).style.visibility = 'visible';
        //document.querySelector(targetID).show();
        //$('#pop_info').show();
        
        // 모달팝업시 배경 스크롤 X
        document.body.style.overflow = "hidden";
    });
    }

    // 팝업 닫기
    for(var j = 0; j < target.length; j++){
    btnPopClose[j].addEventListener('click', function(){
        this.parentNode.parentNode.style.visibility = 'hidden';
        //this.parentNode.parentNode.hide();
        //$('#pop_info').hide();

        // 모달팝업끄면 배경 스크롤 O
        document.body.style.overflow = "unset";
    });
    }


</script>