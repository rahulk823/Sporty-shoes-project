package com.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.details.ClassDetails;

import com.details.StudentDetails;
import com.details.SubjectDetails;
import com.details.TeacherDetails;

public class Util {
	
		private static SessionFactory factory;
		
		public static SessionFactory buildConnection() {
			
			factory = new Configuration().configure("hibernate0.cfg.xml")
					.addAnnotatedClass(StudentDetails.class)	
					.addAnnotatedClass(TeacherDetails.class)
					.addAnnotatedClass(ClassDetails.class)
					.addAnnotatedClass(SubjectDetails.class)
					
					.buildSessionFactory();
			
			return factory;
		}
}