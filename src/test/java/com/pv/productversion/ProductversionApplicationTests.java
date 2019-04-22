package com.pv.productversion;

import com.pv.productversion.service.RelatedService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ProductversionApplication.class)
public class ProductversionApplicationTests {
@Autowired
private RelatedService relatedService;
    //private VersionService versionService;

    @Test
    public void contextLoads() throws Exception{
        //List<VersionRelated> list = relatedService.selectByParent((long) 13);
        //System.out.println("list="+list);
        //Map<String, Object> treeRelated = relatedService.treeRelated();
        //System.out.println("treeRelated="+treeRelated);
        //List<Version> list = versionService.queryRelated((long) 6);
        //System.out.println("list="+list);
         Long id = relatedService.findId((long) 7, (long) 6);
                System.out.println("id="+id);

    }

}

