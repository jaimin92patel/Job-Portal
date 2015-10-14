package csjobs.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import csjobs.AuthenticationSecurity.SecurityUtils;
import csjobs.model.Application;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;
import csjobs.web.validator.UserValidator;

@Controller
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private JobDao jobDao;

    @Autowired
    private UserValidator userValidator;

    private static final Logger logger = LoggerFactory
        .getLogger( UserController.class );

    @RequestMapping(value = "/register.html", method = RequestMethod.GET)
    public String register( ModelMap models )
    {
        models.put( "user", new User() );
        return "register";
    }

    @RequestMapping(value = "/register.html", method = RequestMethod.POST)
    public String register( @ModelAttribute User user,
        BindingResult bindingResult, SessionStatus sessionStatus )
    {
        userValidator.validate( user, bindingResult );
        if( bindingResult.hasErrors() ) return "register";

        user = userDao.saveUser( user );
        sessionStatus.setComplete();

        return "redirect:/";
    }

    @RequestMapping(value = "/login.html", method = RequestMethod.GET)
    public String login()
    {
        return "login";
    }

    @RequestMapping(value = "/loginWithSecurity.html", method = RequestMethod.GET)
    public String login( HttpSession session )
    {
    	String em=SecurityUtils.getUser();
    	User currentUser= userDao.getUser(em);

        logger.info( currentUser.getEmail() + " logged in." );

        session.setAttribute( "authenticatedUser", currentUser );
        if( currentUser.isAdmin() )
            return "redirect:/admin.html";
        else if( currentUser.isReviewer() )
            return "redirect:/reviewer.html";
        else
        	System.out.println("Hii");
            return "redirect:/applicant.html";
    }

    @RequestMapping("/logout.html")
    public String logout( HttpSession session )
    {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/admin.html")
    public String admin(ModelMap models)
    {
    	List<Job> jobs = jobDao.getJobs();
    	Collections.reverse(jobs);
    	models.put("jobs", jobs);
        return "admin";
    }
    

    @RequestMapping("/reviewer.html")
    public String reviewer(HttpSession session, ModelMap models)
    {	
    	//User authenticatedUser = (User) session .getAttribute( "authenticatedUser" );
    	   	
    	String userName = SecurityUtils.getUser();
		User user = userDao.getUser(userName);
		
		List<Job> jobs = jobDao.getJobs();
		
		List<Job> finaljobs = new ArrayList<Job>();
		
		Iterator<Job> it = jobs.iterator(); 	

		while(it.hasNext())
		{
			Job job = it.next();
			
			if( (job.getCommitteeMembers().contains(user)) )
			{	finaljobs.add(job);
			System.out.println("job ---" + job.getTitle());
			}
		}
		
		
		models.put("jobs", finaljobs);
		
	
    	
//    	for(int i=0;i<jobDao.getJobs().size();i++)
//    		for(int j=0;j<jobDao.getJobs().get(i).getCommitteeMembers().size();j++)
//    			if(jobDao.getJobs().get(i).getCommitteeMembers().get(j).getFirstName()==authenticatedUser.getFirstName())
//    			System.out.println(jobDao.getJobs().get(i).getTitle());
    	
        return "reviewer";
    }

    @RequestMapping("/applicant.html")
    public String applicant( HttpSession session, ModelMap models )
    {
        User authenticatedUser = (User) session
            .getAttribute( "authenticatedUser" );

        User user = userDao.getUser( authenticatedUser.getId() );

        Set<Job> appliedJobs = new HashSet<Job>();
        for( Application application : user.getApplications() )
            appliedJobs.add( application.getJob() );

        List<Job> availableJobs = jobDao.getOpenJobs();
        Iterator<Job> iterator = availableJobs.iterator();
        while( iterator.hasNext() )
            if( appliedJobs.contains( iterator.next() ) ) iterator.remove();

        models.put( "user", user );
        models.put( "availableJobs", availableJobs );

        return "applicant";
    }

}
