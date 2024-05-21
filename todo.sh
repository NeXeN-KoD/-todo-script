

#!/bin/sh

echo "**********Welcome to your todo script**********"
echo "1-Create a task"
echo "2-Update a task"
echo "3-Show all information about a task"
echo "4-List tasks of a given day in two output sections"
echo "5-Search for a task by title"
read -p "select an option :" option

case $option in 
	1)
		create_task(){
			echo "Creating a task"
			read -p "id :" id 
			read -p "title :" title
			read -p "description :" description
			read -p "location :" location
			read -p "due date and time (DD-MM-YYYY HH:MM) :" date_time
			read -p "status (completed or uncompleted) :" status
			echo "$id , $title , $description , $location , $date_time , $status" >> resultat.txt
			echo "Task created successfully"
		}

		create_task ;;
		
	2)
		update_task() {
			echo "Updating a task"
			read -p "id to update :" update_id

			if grep -q "^$update_id ," resultat.txt; then
				read -p "new title :" new_title
				read -p "new description :" new_description
				read -p "new location :" new_location
				read -p "new due date and time (DD-MM-YYYY HH:MM): " new_date_time
				read -p "new status (completed or uncompleted): " new_status
				
				tmp_file=$(mktemp)
				sed -e "/^$update_id ,/c\\$update_id , $new_title , $new_description , $new_location , $new_date_time , $new_status" resultat.txt > "$tmp_file"
				mv "$tmp_file" resultat.txt
				
				echo "Task with id $update_id has been updated"
			else
				echo "Error : task with id $update_id not found" >&2
			fi
		}
		update_task ;;
		
	3) 
		show_task_info() {
			echo "Showing information about a task"
			read -p "Enter task id:" id
			if grep -q "^$id ," resultat.txt; then
				grep "^$id ," resultat.txt
			else
				echo "Error : task with id $id not found" >&2
			fi
		}
		show_task_info ;;
   	
	4)
		list_tasks_by_day() {
			read -p "Enter the date (DD-MM-YYYY): " date

			echo "Completed tasks on $date:"   
			grep ", $date [0-9][0-9]:[0-9][0-9] , completed" resultat.txt | awk -F ' , ' -v d="$date" '{if ($5 ~ d) print}'
			
			echo "\nUncompleted tasks on $date:"
			grep ", $date [0-9][0-9]:[0-9][0-9] , uncompleted" resultat.txt | awk -F ' , ' -v d="$date" '{if ($5 ~ d) print}'
		}
        list_tasks_by_day ;;
		
	5)
		search_task_by_title(){
			read -p "Enter the title to search for :" title
			if grep -q ", $title ," resultat.txt; then  	
				grep ", $title ," resultat.txt
			else
				echo "Error: task with title not found" >&2
			fi
		}
		search_task_by_title ;;
		
	*)
        echo "Invalid option. Please choose a valid option."
        ;;
esac
