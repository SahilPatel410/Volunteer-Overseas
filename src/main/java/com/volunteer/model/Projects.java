package com.volunteer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="projects")
@Proxy(lazy=false)
public class Projects {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column
	private String title;
	
	@Column
	private String image;
	
	@Column
	private int min_age;
	
	@Column
	private int max_age;
	
	@Column
	private String overview_description;
	
	@Column
	private String accommodation_description;
	
	@Column
	private String imapact_description;
	
	@Column
	private String project_video_url;

	@Column
	private String volunteer_house_address;
	
	@Column
	private String volunteer_house_description;
	
	@Column
	private String volunteer_work_address;
	
	@Column
	private String volunteer_work_description;
	
	@Column
	private String nearest_airport_address;
	
	@Column
	private String cost_description;
	
	@Column
	private String project_startdate_description;
	
	@Column
	private String is_affordable;
	
	@Column
	private int status;
	
	@Column
	private String created_at;
	
	@Column
	private String updated_at;

	@ManyToOne
    @JoinColumn(name = "organization_id")
	@JsonIgnore
    private Organizations organization;
	
	@ManyToOne
    @JoinColumn(name = "category_id")
	@JsonIgnore
    private Categories category;
	
	@ManyToOne
    @JoinColumn(name = "activity_id")
	@JsonIgnore
    private Activities activity;
	
	@ManyToOne
    @JoinColumn(name = "city_id")
	@JsonIgnore
    private Cities city;
	
	@ManyToOne
    @JoinColumn(name = "country_id")
	@JsonIgnore
    private Countries country;
	
	@OneToMany(mappedBy = "projectApplication", cascade = CascadeType.ALL)
	private Set<Applications> applicationDetails;
	
	@OneToMany(mappedBy = "projectCarouselImage", cascade = CascadeType.ALL)
	private Set<ProjectCarouselImages> projectCarouselImagesDetails;
	
	@OneToMany(mappedBy = "projectCost", cascade = CascadeType.ALL)
	private Set<ProjectCosts> projectCostsDetails;
	
	@OneToMany(mappedBy = "projectIncludeCheck", cascade = CascadeType.ALL)
	private Set<ProjectIncludeChecks> projectIncludeChecksDetails;
	
	@OneToMany(mappedBy = "projectStartDate", cascade = CascadeType.ALL)
	private Set<ProjectStartDates> projectStartDatesDetails;
	
	@OneToMany(mappedBy = "projectViewHistory", cascade = CascadeType.ALL)
	private Set<ProjectViewHistory> projectViewHistoryDetails;
	
	public Projects(){
		
	}
	public Projects(Organizations organization,Activities activity,Categories category, String title2, String image2, int minAge,
			int maxAge, String overviewDesc, String accomdationDesc, String impactDesc, String projectVideoUrl,
			Countries country,Cities city, String volunteerHouseAddress, String volunteerHouseDescription,
			String volunteerWorkAddress, String volunteerWorkDescription, String nearestAirportAddress,
			String costDescription, String projectStartdateDescription, String isAffordable, int status2,
			String createdAt, String updatedAt) {
		this.activity=activity;
		this.category=category;
		this.organization=organization;
		this.city=city;
		this.country=country;
		this.title=title2;
		this.image=image2;
		this.min_age=minAge;
		this.max_age=maxAge;
		this.overview_description=overviewDesc;
		this.accommodation_description=accomdationDesc;
		this.imapact_description=impactDesc;
		this.project_video_url=projectVideoUrl;
		this.volunteer_house_address=volunteerHouseAddress;
		this.volunteer_house_description=volunteerHouseDescription;
		this.volunteer_work_address=volunteerWorkAddress;
		this.volunteer_work_description=volunteerWorkDescription;
		this.nearest_airport_address=nearestAirportAddress;
		this.cost_description=costDescription;
		this.project_startdate_description=projectStartdateDescription;
		this.is_affordable=isAffordable;
		this.status=status2;
		this.created_at=createdAt;
		this.updated_at=updatedAt;
		
	}

	public Projects(int projectId) {
		this.id=projectId;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getMin_age() {
		return min_age;
	}

	public void setMin_age(int min_age) {
		this.min_age = min_age;
	}

	public int getMax_age() {
		return max_age;
	}

	public void setMax_age(int max_age) {
		this.max_age = max_age;
	}

	public String getOverview_description() {
		return overview_description;
	}

	public void setOverview_description(String overview_description) {
		this.overview_description = overview_description;
	}

	public String getAccommodation_description() {
		return accommodation_description;
	}

	public void setAccommodation_description(String accommodation_description) {
		this.accommodation_description = accommodation_description;
	}

	public String getImapact_description() {
		return imapact_description;
	}

	public void setImapact_description(String imapact_description) {
		this.imapact_description = imapact_description;
	}

	public String getProject_video_url() {
		return project_video_url;
	}

	public void setProject_video_url(String project_video_url) {
		this.project_video_url = project_video_url;
	}

	public String getVolunteer_house_address() {
		return volunteer_house_address;
	}

	public void setVolunteer_house_address(String volunteer_house_address) {
		this.volunteer_house_address = volunteer_house_address;
	}

	public String getVolunteer_house_description() {
		return volunteer_house_description;
	}

	public void setVolunteer_house_description(String volunteer_house_description) {
		this.volunteer_house_description = volunteer_house_description;
	}

	public String getVolunteer_work_address() {
		return volunteer_work_address;
	}

	public void setVolunteer_work_address(String volunteer_work_address) {
		this.volunteer_work_address = volunteer_work_address;
	}

	public String getVolunteer_work_description() {
		return volunteer_work_description;
	}

	public void setVolunteer_work_description(String volunteer_work_description) {
		this.volunteer_work_description = volunteer_work_description;
	}

	public String getNearest_airport_address() {
		return nearest_airport_address;
	}

	public void setNearest_airport_address(String nearest_airport_address) {
		this.nearest_airport_address = nearest_airport_address;
	}

	public String getCost_description() {
		return cost_description;
	}

	public void setCost_description(String cost_description) {
		this.cost_description = cost_description;
	}

	public String getProject_startdate_description() {
		return project_startdate_description;
	}

	public void setProject_startdate_description(String project_startdate_description) {
		this.project_startdate_description = project_startdate_description;
	}

	public String getIs_affordable() {
		return is_affordable;
	}

	public void setIs_affordable(String is_affordable) {
		this.is_affordable = is_affordable;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
		public Organizations getOrganization() {
		return organization;
	}

	public void setOrganization(Organizations organization) {
		this.organization = organization;
	}

	public Categories getCategory() {
		return category;
	}

	public void setCategory(Categories category) {
		this.category = category;
	}

	public Activities getActivity() {
		return activity;
	}

	public void setActivity(Activities activity) {
		this.activity = activity;
	}

	public Cities getCity() {
		return city;
	}

	public void setCity(Cities city) {
		this.city = city;
	}

	public Countries getCountry() {
		return country;
	}

	public void setCountry(Countries country) {
		this.country = country;
	}

	public Set<Applications> getApplicationDetails() {
		return applicationDetails;
	}

	public void setApplicationDetails(Set<Applications> applicationDetails) {
		this.applicationDetails = applicationDetails;
	}

	public Set<ProjectCarouselImages> getProjectCarouselImagesDetails() {
		return projectCarouselImagesDetails;
	}

	public void setProjectCarouselImagesDetails(Set<ProjectCarouselImages> projectCarouselImagesDetails) {
		this.projectCarouselImagesDetails = projectCarouselImagesDetails;
	}

	public Set<ProjectCosts> getProjectCostsDetails() {
		return projectCostsDetails;
	}

	public void setProjectCostsDetails(Set<ProjectCosts> projectCostsDetails) {
		this.projectCostsDetails = projectCostsDetails;
	}

	public Set<ProjectIncludeChecks> getProjectIncludeChecksDetails() {
		return projectIncludeChecksDetails;
	}

	public void setProjectIncludeChecksDetails(Set<ProjectIncludeChecks> projectIncludeChecksDetails) {
		this.projectIncludeChecksDetails = projectIncludeChecksDetails;
	}

	public Set<ProjectStartDates> getProjectStartDatesDetails() {
		return projectStartDatesDetails;
	}

	public void setProjectStartDatesDetails(Set<ProjectStartDates> projectStartDatesDetails) {
		this.projectStartDatesDetails = projectStartDatesDetails;
	}

	public Set<ProjectViewHistory> getProjectViewHistoryDetails() {
		return projectViewHistoryDetails;
	}

	public void setProjectViewHistoryDetails(Set<ProjectViewHistory> projectViewHistoryDetails) {
		this.projectViewHistoryDetails = projectViewHistoryDetails;
	}
}
