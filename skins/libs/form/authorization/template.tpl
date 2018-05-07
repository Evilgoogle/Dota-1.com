<form action="" method="POST" class="form-authorization" enctype="multipart/form-data"><table>
    <tr>
      <td>
        <input type="<?php echo $this->content['login']['type']; ?>" name="<?php echo $this->content['login']['name']; ?>" value="<?php echo $this->content['login']['value']; ?>" <?php echo $this->content['login']['attrs']; ?>>
      </td>
    </tr>
    <tr>
      <td>
        <input type="<?php echo $this->content['password']['type']; ?>" name="<?php echo $this->content['password']['name']; ?>" value="<?php echo $this->content['password']['value']; ?>" <?php echo $this->content['password']['attrs']; ?>>
      </td>
    </tr>
    <tr<?php if(!empty($this->content['submit']['error'])) {echo ' style="background-color:#900"';} ?>>
      <td colspan="3">
        <div align="center">
          <input type="submit" name="<?php echo $this->content['submit']['name']; ?>" value="<?php echo $this->content['submit']['value']; ?>" <?php echo $this->content['submit']['attrs']; ?>><br>
        </div>
      </td>
    </tr>
</table>
<input type="hidden" name="<?php echo $this->content['antixsrf']['name']; ?>" value="<?php echo $this->content['antixsrf']['value']; ?>">
</form>