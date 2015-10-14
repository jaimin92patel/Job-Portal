package csjobs.web.controller;


import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import csjobs.model.Application;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;
import csjobs.web.editor.UserPropertyEditor;

@Controller
public class JobController {

    @Autowired
    private JobDao jobDao;
    
    @Autowired
    private UserDao userDao;
    
    @Autowired
    private ApplicationDao applicationDao;
    
    @Autowired
    private WebApplicationContext context;
	
	 @InitBinder
	 public void initBinder( WebDataBinder binder )
	 {
	      binder.registerCustomEditor( User.class,
	    		  (UserPropertyEditor) context.getBean( "userPropertyEditor" ) );
	      
	      binder.registerCustomEditor( Date.class, new CustomDateEditor(
		            new SimpleDateFormat( "MM/dd/yyyy" ), true ) );
	 }
	 
	
    @RequestMapping({ "/index.html", "/job/list.html" })
    public String list( ModelMap models )
    {
        models.put( "openJobs", jobDao.getOpenJobs() );
        return "job/list";
    }

    @RequestMapping("/job/view.html")
    public String view( @RequestParam Long id, ModelMap models )
    {
        models.put( "job", jobDao.getJob( id ) );
        return "job/view";
    }
    
    @RequestMapping("/application/ViewJobsByAdmin.html")
    public String ViewJobsByAdmin(@RequestParam Long id, ModelMap models)
    {
    	models.put( "job", jobDao.getJob( id ) );
    	return "application/ViewJobsByAdmin";
    }
    
    @RequestMapping(value="/job/CreateNewJob.html",method=RequestMethod.GET)
    public String CreateNewJob(ModelMap models)
    {
    	List<User> users =userDao.getUsers();
    	List<User> commiteeChairs = new ArrayList<User>();
    	
    	Iterator<User> it = users.iterator(); 	

		while(it.hasNext())
		{
			User u = it.next();
			
			if(u.isReviewer())
			commiteeChairs.add(u);
			
		}
    	
		models.put("job",new Job());
		models.put("ComitteeChairList",commiteeChairs);
    	
//    	List<User> commiteeChairs=userDao.getUsers();
//    	User reviewer = new User();
//    	for(int i=0;i<commiteeChairs.size();i++)
//    	{
//    		if(commiteeChairs.get(i).isReviewer())
//    			commiteeChairs.add(reviewer);
//    		
//    	}
//    	models.put("ComitteeChairList",commiteeChairs);
//     	models.put("job",new Job());
    	return "job/CreateNewJob";
    }
    
    @RequestMapping(value="/job/CreateNewJob.html",method=RequestMethod.POST)
    public String CreateNewJob(@ModelAttribute Job jobFrom)
    {	
    	if( ! ( jobFrom.getCommitteeMembers().contains(jobFrom.getCommitteeChair())) )
    		jobFrom.getCommitteeMembers().add(jobFrom.getCommitteeChair());
    	
    	jobFrom = jobDao.saveJob( jobFrom );
    	
    	return "redirect:../admin.html";
    }
    
    @RequestMapping(value="/job/Edit.html",method=RequestMethod.GET)
    public String editJob(@RequestParam Long id,ModelMap models)
    {	
    	
    	List<User> users =userDao.getUsers();
	  List<User> commiteeChairs = new ArrayList<User>();
	
	Iterator<User> it = users.iterator(); 	

	while(it.hasNext())
	{
		User u = it.next();
		
		if(u.isReviewer())
		commiteeChairs.add(u);
		
	}
	
	
	models.put("ComitteeChairList",commiteeChairs);
    	
    	Job job=jobDao.getJob(id);
    	models.put("job",job);
    	return "job/Edit";
    }
    
    @RequestMapping(value="/job/Edit.html",method=RequestMethod.POST)
    public String editJob(@ModelAttribute Job editJob)
    {	
    	if( ! ( editJob.getCommitteeMembers().contains(editJob.getCommitteeChair())) )
    		editJob.getCommitteeMembers().add(editJob.getCommitteeChair());
    	
    	editJob = jobDao.saveJob( editJob );
    	return "redirect:../admin.html";
    }
    
    
	@RequestMapping("/application/ViewApplicantsByAdmin.html")
    public String ViewApplicantsByAdmin(@RequestParam Long id, ModelMap models)
    {
		List<Application> apps = applicationDao.getApplications();
		
		Iterator<Application> it = apps.iterator(); 
		
		while(it.hasNext())
		{
				Application app = it.next();
								
				if( !(id == app.getId()) )
					it.remove();
					
				
		}
		
		
		
		
/*//    	csjobs.model.Job job=jobDao.getJob(id);
//    	ArrayList<String> names = new ArrayList<String>();
//    	List a1 = new ArrayList();
//    	job.getApplications().get(0).getApplicant();
//    	
//    	ArrayList<csjobs.model.Application> entries = new ArrayList<csjobs.model.Application>();
//    	for(int i=0;i<job.getApplications().size();i++)
//    	{
//    		//if(id==job.getApplications().get(i).getJob().getId())
//    			//entries.add(job.getApplications().get(i).getJob().getId());
//    		
//    	}
*/    	
    	models.put("apps", apps);
    	return "application/ViewApplicantsByAdmin";
    }
}
