
        <div class="lst db">
            <ul>
                <?php 
                    if($view){
                      $sql = "SELECT * FROM g5_write_0101 WHERE wr_is_comment = 0  and wr_1 like '%".$view."%' order by wr_id desc limit 8 ";
                      $result = sql_query($sql);
                    }else{
//                      $sql = "SELECT * FROM g5_write_0101 WHERE wr_is_comment = 0 order by rand() limit 8 ";
//                      $result = sql_query($sql);
                      $sql = "SELECT * FROM g5_write_0101 WHERE wr_is_comment = 0  and wr_1 like '%".$lst['wr_1']."%' order by wr_id desc limit 8  ";
                      $result = sql_query($sql);
                    }
                    { 
                        ?>
                        <?php 
                        
                            for($i=0; $row=sql_fetch_array($result); $i++){                 
                        ?>
                        <?php 
                          $write = get_thumbnail_find_cache('0101', $row['wr_id'], 'content');
                          $edt = true;
                          
                          if( $matches = get_editor_image($write['wr_content'], false) ){
                              for($i=0; $i<count($matches[1]); $i++)
                              {
                                  // 이미지 path 구함
                                  $p = parse_url($matches[1][$i]);
                                  if(strpos($p['path'], '/'.G5_DATA_DIR.'/') != 0)
                                      $data_path = preg_replace('/^\/.*\/'.G5_DATA_DIR.'/', '/'.G5_DATA_DIR, $p['path']);
                                  else
                                      $data_path = $p['path'];
                  
                                  $srcfile = G5_PATH.$data_path;
                  
                                  if(preg_match("/\.({$config['cf_image_extension']})$/i", $srcfile) && is_file($srcfile)) {
                                      $size = @getimagesize($srcfile);
                                      if(empty($size))
                                          continue;
                  
                                      $filename = basename($srcfile);
                                      $filepath = dirname($srcfile);
                  
                                      preg_match("/alt=[\"\']?([^\"\']*)[\"\']?/", $matches[0][$i], $malt);
                                      $alt = isset($malt[1]) ? get_text($malt[1]) : '';
                  
                                      break;
                                  }
                  
                                  $filename = run_replace('get_editor_filename', $filename, $p);
                              }   //end for
                          } 
                          $thumb = get_list_thumbnail('0101', $row['wr_id'], '400', '400', false, true);
                        ?>
                            <?php 
                                $qry = "select * from follow where mem_id = '".$member['mb_id']."' and target_mem_id='".$row['mb_id']."' ";
                                $check = sql_fetch($qry);

                                $sql_member = " SELECT * FROM g5_member WHERE mb_id = '".$row['mb_id']."' ";
                                $row_member = sql_fetch($sql_member);
                            ?>
                            <li class="v_slide <?php if(count($matches[1])>1) echo "lot_ico" ?>">
                                <div class="bd_lst_profile">
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
                                        <p class="t2 tov"><?=$row_member['mb_profile']?></p>
                                    </div>
                                </div>


                                <div class="bg">                   
                                    <!-- <a href="/bbs/board.php?bo_table=0101&wr_id=<?=$row['wr_id']?>" class="wrap"> -->
                                    <a href="#pop<?=$row['wr_id']?>" class="btn_open wrap">
                                        <!-- <div class="wrap"> -->
                                        <div class="img" style="">
                                        <?php 


                                            $thumb = get_list_thumbnail('0101', $row['wr_id'], '400', '400', false, true);

                                            if($thumb['src']) {
                                                $img_content = '<img src="'.$thumb['src'].'" alt="'.$thumb['alt'].'">';
                                            } else {
                                                $img_content = '<span class="no_image abs"></span>';
                                            }
                                            echo run_replace('thumb_image_tag', $img_content, $thumb);
                                            
                                        ?>
                                        </div>
                                        <!-- </div> -->
                                    </a>
                                </div>



                                <?php
                                    include(G5_BBS_PATH.'/test2.php');
                                    // echo $write['wr_content'];
                                ?>


                                
                                

                                
                                <div class="gall_ico_line cb">
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

                                   <div class="gall_text_href">
                                        
                                        <p class="tov3"><?php echo utf8_strcut(strip_tags($row['wr_content']), 78, '..'); ?><?php if($row['wr_3']) echo $row['wr_3'] ?></p>
                                    </div>
                              
                            </li>
                        <?php } ?>
                <?php } ?>
            </ul>
            <a href="/bbs/board.php?bo_table=0101" class="main_more">더보기</a>
        </div>
        










        <script>
					function go_flow(mb_id , i){
						<?php if(!$member['mb_id']){ ?>
							alert('로그인 후 이용 바랍니다.');
						<?}else{?>
//							alert(mb_id);
							if(mb_id == "<?=$member['mb_id']?>"){
								alert('자기 자신은 팔로우 할수 없습니다.');
							}else{
								$.ajax({
									url:'/bbs/ajax.follow.php',
									data : {
										'mb_id':mb_id , 
										},
									type:'POST',
									dataType:'json',
									success:function(data){
										if(data == 1){
											alert("팔로우되었습니다");
											$("#js_test_"+i).text('팔로잉');
										}else if(data == 2){
											alert("팔로우 가 취소 되었습니다");
											$("#js_test_"+i).text('팔로우');
										}
									},error:function(request,status,error){
		//                                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									}
								});
							}
						<?}?>
					}

        </script>