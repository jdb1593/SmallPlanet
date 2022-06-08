<?php
    $csql = " select * from $write_table where wr_parent = $wr_id and wr_is_comment = 1 order by wr_comment, wr_comment_reply ";
    $cresult = sql_query($csql);
    $clist = array();
    for ($ci=0; $crow=sql_fetch_array($cresult); $ci++)
    {
        $clist[$ci] = $crow;
        
    }
?>