function(){
	tabPanel("About",
		HTML("<h1> Zhifan(Van) Shen</h1>
        <p >What if Earth gets a little bit warmer? The sky is still blue. It still gets really colds sometime. Earth is still awesome. So what is the problem? Well, after lots of observing and measurements, scientists see some serious changes. It's happening too fast, much fast than it happened in Earth's past history. Carbon dioxide is a greenhouse gas which traps heat from Earth's surface and holds the heat in the atmosphere. In my first graph, it shows CO2 levels of worldwide and Northern Hemisphere over the 40 years. As you can see, CO2 levels increase very fast and constantly. In second graph, I am using Vancouver annual temperature data over 100 years as a perspective, it has risen over 2 degrees! What is the big deal with a few degrees anyway? Well, think of this way: between 0 and 1 Celsius, that is the difference between ice and water. Now let's look at graphs together, you can easily see how temperature changes with the CO2 levels. Climate changing is real! Keep cautious and take actions!</p>
		<p>As a data science student, I have developed skills using R and SQL software to create data-driven analytical graphs. This semester I have finished a project, story-telling R Shiny App using my R and HTML skills to make a point on climate changing topic. Meanwhile, I have taken online courses to strengthen my data visualization skills, such as Power BI and Tableau. I like to attend the Learning Data Science Meetup Group and discussing kaggle competitions. I found it is beneficial to learn from the best and gain valuable experience from others. Currently, I am working on a kaggle public dataset Heart Disease UCI by performing basic plots to analyze heart disease data with Python. My past accounting business education background has become the first original source of my passion for data and numbers. In addition, I worked as a Restaurant Manager for two and half years, and developed my abilities to explore business concepts and apply critical thinking to the values of products. I collected data and created reports with accounting skills to provide related business insights, and collaborated with partners to implement certain changes. </p>"
		),#end of html part 1.
        #Notice that I used double quotes (") above because otherwise it would interfere with
        # the single quote in the word (don't)
        HTML('
        
        <img src="https://pbs.twimg.com/profile_images/1115410961144221697/9dzdP3Dv_400x400.jpg" alt="" style="height: 380px; width: 280px;" >
        <p>
        <br>Zhifan(Van) Shen<br>
        Data Science Program Student<br>
        Simon Fraser University<br>
        <a href="https://www.linkedin.com/in/zhifan-shen-7285a2160/" target="_blank">Linkedin</a> <br/>
        </p>'),#End of html part 2
		
		value="about"
	)
}
