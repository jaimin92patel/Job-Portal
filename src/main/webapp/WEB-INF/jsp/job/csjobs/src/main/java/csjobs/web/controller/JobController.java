package csjobs.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.JobDao;

@Controller
public class JobController {

    @Autowired
    private JobDao jobDao;

    @RequestMapping({ "/index.html", "/job/list.html" })
    public String list( ModelMap models )
    {
        models.put( "openJobs", jobDao.getOpenJobs() );
        return "job/list";
    }

    @RequestMapping("/job/view.html")
    public String view( @RequestParam Long id, ModelMap models )
    {
    	Job job = jobDao.getJob(id);
        
        List<User> committeeMembers = job.getCommitteeMembers();
        User chair = job.getCommitteeChair();
        
        for(User u: committeeMembers){
        	if (u.getId() == chair.getId()){
        		committeeMembers.remove(u);
        		break;
        	}
        }
        models.put( "job", job );
        models.put( "chair", chair);
        models.put("nonchairCommitteMembers", committeeMembers);
        return "job/view";
    }
}
